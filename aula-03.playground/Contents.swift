//: Playground - noun: a place where people can play

// Operadores
// +, -, *, =, !, >, <, >=, <=, &&, ||

// Colecoes

// Array: Colecao ordenanda de elementos de mesto tipo

var invites: [String] = [
    "Jaqueline",
    "Paula",
    "Thiago",
    "Camila",
    "Raquel"
]

// Add
invites.append("Carol")

// Remover
invites.remove(at: 1)
if let index = invites.index(of: "Camila") {
    invites.remove(at: index)
}

// Metodo contains
invites.contains("Raquel")

print(invites[3])

// Dicionarios: Colecao NAO-ORDENADA de elementos de mesmo tipo, acessiveis atraves de uma chave
var states = [
    "SP": "São Paulo",
    "MG": "Minas Gerais",
    "PA": "Pará"
]

// Maneira correta de desembulhar um OPTIONALS
if let state = states["SP"] {
    print(states)
} else {
    print("Não cadastrado")
}

// Adcionar no dicionario
states["RJ"] = "Rio de Janeiro"

// Ecluir item no dicionario
//states["RJ"] = nil

// Contar
states.count
invites.count
"FIAP School".count

for convidado in invites {
    print("\n\(convidado), foi convidado oara a festa")
}
for state in states {
    print("\n\(state.key), - \(state.value)")
}

// Tupla
let address: ( street: String, number: Int, zipCode: String) = ("Av. Paulista", 1200, "01456-0999")

// Decompor uma TUPLA
var (street, number, zipCode) = address

// Operador RANGE (Half Open Range)
for i in 0..<invites.count {
    print("Convidado número: \(i+1) é \(invites[i])")
}

// While
var j = 0;
while j < invites.count {
    print("O convidado \(j+1) é \(invites[j])")
    j += 1
}

// +, -, /, *, >-<



