import direcciones.*
import comidas.*
object pepita {
	var property position = game.center()
	var energia = 500
	var image = "pepita.png"
	
	method comer(alimento) {
		energia += alimento.energiaQueOtorga()
		game.removeVisual(alimento)
		game.say(self, "Ñam ñam")
	}

	method volar() {
		energia = 0.max(energia - 9)
	}
	
	method energia() {
		return energia
	}

	method image(){
		return image
	}

	method descender(){
		position = abajo.siguiente(position)
	}

	method mover(direccion){
		if (energia != 0){
			position = direccion.siguiente(position)
			self.volar()
		}
	}

	method ganar(){
		image = "pepita-grande.png"
		energia = 0
		game.say(self, "!GANE!")
		game.schedule(2000, {game.stop()})
	}

	method perder(){
		image = "pepita-gris.png"
		energia = 0
		game.say(self, "!PERDI!")
		game.schedule(2000, {game.stop()})
	}
}

object silvestre{
	var property position = game.at(0,2)

	method perseguir (personaje){
		if (personaje.position().x() >= 3 and personaje.position() != position){
			if (position.x() > personaje.position().x()){
				position = position.left(1)
			} else {
				position = position.right(1)
			}
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


object muro{
	const position = game.at(2,2)

	method image (){
		return "muro.png"
	}

	method position(){
		return position
	}
}
