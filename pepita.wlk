object pepita {
	var property position = game.center()
	var energia = 500
	var image = "pepita.png"

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method volar() {
		if (energia == 0){
			image = "pepita-gris.png"
		} else {
			energia = 0.max(energia - 9)
		}
	}
	
	method energia() {
		return energia
	}

	method image(){
		return image
	}

	method colisionarConPersonaje(personaje){
		if (position == personaje.position()){
			image = "pepita-gris.png"
		} else {
			image = "pepita.png"
		}
	}
}

object silvestre{
	var property position = game.at(0,2)

	method perseguir (personaje){
		if (position.x() > personaje.position().x()){
			position = position.left(1)
		} else if (position.x() < personaje.position().x()){
			position = position.right(1)
		}
	}

	method image(){
		return "silvestre.png"
	}
}

object nido{
	var property position = game.at(9, 0)

	method image(){
		return "nido.png"
	}
}
