import wollok.game.*
import visuales.*
import arbustos.*

object arbustoFactory {
	method draw(arbusto, posicion) {
		posicion.drawElement(arbusto)
		game.whenCollideDo(arbusto, { g => arbusto.empuja(g) })
	}
	
	method drawVerticalBlock(x, y) {
		self.draw(new ArbustoDerecha(), new Position(x=x, y=y))
		self.draw(new ArbustoDerecha(), new Position(x=x, y=y+1))
		self.draw(new ArbustoIzquierda(), new Position(x=x+1, y=y))
		self.draw(new ArbustoIzquierda(), new Position(x=x+1, y=y+1))
	}
	
	method drawHorizontalBlock(x, y) {
		self.draw(new ArbustoArriba(), new Position(x=x, y=y))
		self.draw(new ArbustoArriba(), new Position(x=x+1, y=y))
		self.draw(new ArbustoAbajo(), new Position(x=x, y=y+1))
		self.draw(new ArbustoAbajo(), new Position(x=x+1, y=y+1))
	}
}