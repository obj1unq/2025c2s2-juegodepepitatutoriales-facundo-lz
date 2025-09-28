import direcciones.*
import comidas.*
object pepita {
	var property position = game.center()
	var energia = 500
	var image = "pepita.png"
	const objetivo = nido
	const perseguidor = silvestre
	
	method comer() {
		if (self.puedeComer(manzana)){
			energia = energia + alpiste.energiaQueOtorga()
			game.say(self, energia.toString())
		}
		if (self.puedeComer(alpiste)){
			energia = energia + alpiste.energiaQueOtorga()
			game.say(self, energia.toString())
		}
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
		if (!self.puedeMoverse()){
			position = abajo.siguiente(position)
		}
	}

	method mover(direccion){
		if (!self.puedeMoverse()){
			position = direccion.siguiente(position)
			self.volar()
			self.comer()
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
			game.say(self, "!GANE!")
		} else {
			image = "pepita-gris.png"
			game.say(self, "!PERDI!")
		}
	}

	method puedeMoverse(){
		return energia == 0 or self.ganoElJuego() or position == perseguidor.position()
	}

	method puedeComer(comida){
		return position == comida.position()
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
