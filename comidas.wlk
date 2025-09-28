import wollok.game.*

object manzana {
	const base= 5
	var madurez = 1
	const position = game.at(0,4)

	method image(){
		return "manzana.png"
	}

	method position(){
		return position
	}
	
	method energiaQueOtorga() {
		return base * madurez	
	}
	
	method madurar() {
		madurez = madurez + 1
	}

}

object alpiste {
	const position = game.at(0,5)

	method image(){
		return "alpiste.png"
	}

	method position(){
		return position
	}

	method energiaQueOtorga() {
		return 20
	} 

}

