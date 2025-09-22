
object pepita {
	var property position = game.center()
	var energia = 100
	var property image = "pepita.png"

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method volar(kms) {
		energia = energia - 10 - kms 
	}
	
	method energia() {
		return energia
	}
}

object silvestre{
	var property position = game.origin()

	method moverIzquierda(){
		position = position.left(1)
	}

	method moverDerecha(){
		position = position.right(1)
	}

	method image(){
		return "silvestre.png"
	}
}

object nido{
	var property position =  
}
