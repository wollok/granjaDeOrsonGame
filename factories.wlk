import wollok.game.*
import visuales.*
import arbustos.*

object arbustoFactory {
	method draw(arbusto) {
		game.addVisual(arbusto)
		game.whenCollideDo(arbusto, { elemento => arbusto.empuja(elemento) })
	}
	
	method drawVerticalBlock(x, y) {
		self.draw(new ArbustoDerecha(position = new Position(x=x, y=y)))
		self.draw(new ArbustoDerecha(position = new Position(x=x, y=y+1)))
		self.draw(new ArbustoIzquierda(position = new Position(x=x+1, y=y)))
		self.draw(new ArbustoIzquierda(position = new Position(x=x+1, y=y+1)))
	}
	
	method drawHorizontalBlock(x, y) {
		self.draw(new ArbustoArriba(position = new Position(x=x, y=y)))
		self.draw(new ArbustoArriba(position = new Position(x=x+1, y=y)))
		self.draw(new ArbustoAbajo(position = new Position(x=x, y=y+1)))
		self.draw(new ArbustoAbajo(position = new Position(x=x+1, y=y+1)))
	}
}