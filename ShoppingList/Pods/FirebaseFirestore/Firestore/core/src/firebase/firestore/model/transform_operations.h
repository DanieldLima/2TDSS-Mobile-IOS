/*
 * Copyright 2018 Google
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef FIRESTORE_CORE_SRC_FIREBASE_FIRESTORE_MODEL_TRANSFORM_OPERATIONS_H_
#define FIRESTORE_CORE_SRC_FIREBASE_FIRESTORE_MODEL_TRANSFORM_OPERATIONS_H_

#if !defined(__OBJC__)
#error "This header only supports Objective-C++."
#endif  // !defined(__OBJC__)

#include <utility>
#include <vector>

#import "Firestore/Source/Model/FSTFieldValue.h"

#include "Firestore/core/include/firebase/firestore/timestamp.h"

namespace firebase {
namespace firestore {
namespace model {

// TODO(zxu123): We might want to refactor transform_operations.h into several
// files when the number of different types of operations grows gigantically.
// For now, put the interface and the only operation here.

/** Represents a transform within a TransformMutation. */
class TransformOperation {
 public:
  /** All the different kinds to TransformOperation. */
  enum class Type {
    ServerTimestamp,
    ArrayUnion,
    ArrayRemove,
    Test,  // Purely for test purpose.
  };

  virtual ~TransformOperation() {
  }

  /** Returns the actual type. */
  virtual Type type() const = 0;

  /**
   * Computes the local transform result against the provided `previousValue`,
   * optionally using the provided localWriteTime.
   */
  virtual FSTFieldValue* ApplyToLocalView(
      FSTFieldValue* previousValue, FIRTimestamp* localWriteTime) const = 0;

  /**
   * Computes a final transform result after the transform has been acknowledged
   * by the server, potentially using the server-provided transformResult.
   */
  virtual FSTFieldValue* ApplyToRemoteDocument(
      FSTFieldValue* previousValue, FSTFieldValue* transformResult) const = 0;

  /** Returns whether the two are equal. */
  virtual bool operator==(const TransformOperation& other) const = 0;

  /** Returns whether the two are not equal. */
  bool operator!=(const TransformOperation& other) const {
    return !operator==(other);
  }

  // For Objective-C++ hash; to be removed after migration.
  // Do NOT use in C++ code.
  virtual NSUInteger Hash() const = 0;
};

/** Transforms a value into a server-generated timestamp. */
class ServerTimestampTransform : public TransformOperation {
 public:
  ~ServerTimestampTransform() override {
  }

  Type type() const override {
    return Type::ServerTimestamp;
  }

  FSTFieldValue* ApplyToLocalView(FSTFieldValue* previousValue,
                                  FIRTimestamp* localWriteTime) const override {
    return [FSTServerTimestampValue
        serverTimestampValueWithLocalWriteTime:localWriteTime
                                 previousValue:previousValue];
  }

  FSTFieldValue* ApplyToRemoteDocument(
      FSTFieldValue* /* previousValue */,
      FSTFieldValue* transformResult) const override {
    return transformResult;
  }

  bool operator==(const TransformOperation& other) const override {
    // All ServerTimestampTransform objects are equal.
    return other.type() == Type::ServerTimestamp;
  }

  static const ServerTimestampTransform& Get() {
    static ServerTimestampTransform shared_instance;
    return shared_instance;
  }

  // For Objective-C++ hash; to be removed after migration.
  // Do NOT use in C++ code.
  NSUInteger Hash() const override {
    // arbitrary number, the same as used in ObjC implementation, since all
    // instances are equal.
    return 37;
  }

 private:
  ServerTimestampTransform() {
  }
};

/**
 * Transforms an array via a union or remove operation (for convenience, we use
 * this class for both Type::ArrayUnion and Type::ArrayRemove).
 */
class ArrayTransform : public TransformOperation {
 public:
  ArrayTransform(Type type, std::vector<FSTFieldValue*> elements)
      : type_(type), elements_(std::move(elements)) {
  }

  ~ArrayTransform() override {
  }

  Type type() const override {
    return type_;
  }

  FSTFieldValue* ApplyToLocalView(
      FSTFieldValue* previousValue,
      FIRTimestamp* /* localWriteTime */) const override {
    return Apply(previousValue);
  }

  FSTFieldValue* ApplyToRemoteDocument(
      FSTFieldValue* previousValue,
      FSTFieldValue* /* transformResult */) const override {
    // The server just sends null as the transform result for array operations,
    // so we have to calculate a result the same as we do for local
    // applications.
    return Apply(previousValue);
  }

  const std::vector<FSTFieldValue*>& elements() const {
    return elements_;
  }

  bool operator==(const TransformOperation& other) const override {
    if (other.type() != type()) {
      return false;
    }
    auto array_transform = static_cast<const ArrayTransform&>(other);
    if (array_transform.elements_.size() != elements_.size()) {
      return false;
    }
    for (size_t i = 0; i < elements_.size(); i++) {
      if (![array_transform.elements_[i] isEqual:elements_[i]]) {
        return false;
      }
    }
    return true;
  }

  // For Objective-C++ hash; to be removed after migration.
  // Do NOT use in C++ code.
  NSUInteger Hash() const override {
    NSUInteger result = 37;
    result = 31 * result + (type() == Type::ArrayUnion ? 1231 : 1237);
    for (FSTFieldValue* element : elements_) {
      result = 31 * result + [element hash];
    }
    return result;
  }

  static const std::vector<FSTFieldValue*>& Elements(
      const TransformOperation& op) {
    HARD_ASSERT(op.type() == Type::ArrayUnion ||
                op.type() == Type::ArrayRemove);
    return static_cast<const ArrayTransform&>(op).elements();
  }

 private:
  Type type_;
  std::vector<FSTFieldValue*> elements_;

  /**
   * Inspects the provided value, returning a mutable copy of the internal array
   * if it's an FSTArrayValue and an empty mutable array if it's nil or any
   * other type of FSTFieldValue.
   */
  static NSMutableArray<FSTFieldValue*>* CoercedFieldValuesArray(
      FSTFieldValue* value) {
    if ([value isMemberOfClass:[FSTArrayValue class]]) {
      return [NSMutableArray
          arrayWithArray:reinterpret_cast<FSTArrayValue*>(value).internalValue];
    } else {
      // coerce to empty array.
      return [NSMutableArray array];
    }
  }

  FSTFieldValue* Apply(FSTFieldValue* previousValue) const {
    NSMutableArray<FSTFieldValue*>* result =
        ArrayTransform::CoercedFieldValuesArray(previousValue);
    for (FSTFieldValue* element : elements_) {
      if (type_ == Type::ArrayUnion) {
        if (![result containsObject:element]) {
          [result addObject:element];
        }
      } else {
        HARD_ASSERT(type_ == Type::ArrayRemove);
        [result removeObject:element];
      }
    }
    return [[FSTArrayValue alloc] initWithValueNoCopy:result];
  }
};

}  // namespace model
}  // namespace firestore
}  // namespace firebase

#endif  // FIRESTORE_CORE_SRC_FIREBASE_FIRESTORE_MODEL_TRANSFORM_OPERATIONS_H_
