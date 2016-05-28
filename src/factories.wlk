import visuales.*
import arbustos.*

object arbustoFactory {
	method draw(arbusto, posicion) {
		posicion.drawElement(arbusto)
		wgame.whenCollideDo(arbusto, { g => arbusto.empuja(g) })
	}
	
	method drawVerticalBlock(x, y) {
		self.draw(new ArbustoDerecha(), new Position(x, y))
		self.draw(new ArbustoDerecha(), new Position(x, y+1))
		self.draw(new ArbustoIzquierda(), new Position(x+1, y))
		self.draw(new ArbustoIzquierda(), new Position(x+1, y+1))
	}
	
	method drawHorizontalBlock(x, y) {
		self.draw(new ArbustoArriba(), new Position(x, y))
		self.draw(new ArbustoArriba(), new Position(x+1, y))
		self.draw(new ArbustoAbajo(), new Position(x, y+1))
		self.draw(new ArbustoAbajo(), new Position(x+1, y+1))
	}
}