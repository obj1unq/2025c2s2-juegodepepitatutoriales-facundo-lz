import direcciones.*
object pepita {
	var property position = game.center()
	var energia = 500
	var image = "pepita.png"
	const objetivo = nido
	const perseguidor = silvestre

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
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

	method mover(direccion){
		if (energia > 0 and !self.ganoElJuego() and position != perseguidor.position()){
			position = direccion.siguiente(position)
			self.volar()
		} else {
			self.cambiarImagen()
		}
	}

	method ganoElJuego(){
		return position == objetivo.position()
	}

	method cambiarImagen(){
		if (self.ganoElJuego()){
			image = "pepita-grande.png"
		} else {
			image = "pepita-gris.png"
		}
	}
}

object silvestre{
	var property position = game.at(0,3)

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
