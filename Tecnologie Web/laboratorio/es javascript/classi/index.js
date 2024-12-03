function Persona(nome, altezza, nascita) {
  this.nome = nome
  this.altezza = altezza
  this.nascita = nascita
  this.saluta = function () { 
    return "ciao sono "+ this.nome
  }
}

let mario = new Persona("mario", 120, new Date(2020, 21, 3))

console.log(mario.saluta())
console.log(mario)
let alice = Persona("Alice", 14)

console.log(alice)

var a = 5
let b = 124
c = 9

function bruh(){
  return a+b
}

console.log(bruh()-c)

function foob(mult){
  let a = 10
  return a*mult
}

console.log(foob(2))

Counter = function(){
  var state = 0; // scope locale
  return{
    incrementa: function(){
      return ++state;
    },
    decrementa: function(){
      return --state;
    },
    get: function() {
      return state;
    }
  }
}

var c = new Counter();
c.incrementa()
c.incrementa()
c.state = 62 // non accede al valore interno di c.state
c.decrementa()
console.log(c.get())

// IIFE: immediately invoked function expression

var people = (
    function (){
      var persone = [];
      return{
        add: function(p){persone.push(p)},
        lista: function (){return persone.join(', ')}
      }
    }
) () // queste due parentesi servono per invocare immediatamente la funzione

people.add("a")
people.add("b")
people.add("c")
people.add("d")
people.add("e")

console.log(people.lista())

let firstName = "SIMONE"
let x = `Ciao ${firstName}!!`
console.log(x)

let s = ""
for(let i = 1; i <= 100; i++) {s+="🤓"}
console.log(s)