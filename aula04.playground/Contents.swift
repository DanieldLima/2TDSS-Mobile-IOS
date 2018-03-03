//: Playground - noun: a place where people can play

import UIKit

enum Compass {
    case north
    case south
    case east
    case west
    
}
var heading: Compass = .north

/*
switch heading {
case .north:
    print("Você esta indo para o norte")
case .south:
    print("Você esta indo para o oeste")
case .east:
    print("Você esta indo para o leste")
case .west:
    print("Você esta indo pa o oeste")
}
 */

switch heading {
case .north:
    print("Você esta indo para o norte")
default:
    print("Você esta indo em outra direção")
}


var speed = 110.0

switch speed {
case 0.0..<20.0:
    print("Primeira marcha")
case 20.0..<40.0:
    print("Segunda marcha")
case 40.0..<90.0:
    print("Terceira marcha")
case 90.0..<120.0:
    print("Quarta marcha")
default:
    print("Quinta marcha")
}

var letter = "j"

switch letter {
case "a"..<"m":
    print("A letra encontrase na primeira parte do alfabeto")
default:
    print("A letra encontrase na segunda parte do alfabeto")
}

print(heading)

// Valor atribuido
enum Weekday: String {
    case sunday = "Domingo"
    case monday = "Segunda"
    case tuesday = "Terça"
    case wednestday = "Quarta"
    case thursday = "Quinta"
    case friday = "Sexta"
    case saturday = "Sabado"
}

var today = Weekday.friday

print("Hoje é \(today.rawValue)")

//Valor associado
enum Measure {
    case age(UInt)
    case weight(Double)
    case size(width: Double, height: Double)
}

var measure: Measure = .age(30)
var measure2: Measure = Measure.size(width: 30.0, height: 45.9)

switch measure2 {
case .age(let age):
    print("A sua idade é: \(age) anos")
case .weight(let peso):
    print("O seu peso é: \(peso)")
case .size(let width, let height): //.size(let width, let height):
    print("Tamanho: \(width) x \(height)") // \(size.width) x \(size.height)
}
// Classe = Reference Type
// Struct = Value Type = Cria uma cópia na memoria
//Tecnica Copy on Write para evitar a cópia desnecesária Struct
struct Driver {
    var name: String
    var age: Int
    var cnh : String
}

var driver: Driver = Driver(name: "Daniel", age: 30, cnh: "30698756")
var driver2 = driver
driver2.name = "Joãozinho"

print(driver.name)
print(driver2.name)




