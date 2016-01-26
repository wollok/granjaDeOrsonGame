import visuales.*
import arbustos.*

object arbustoFactory {
	method draw(arbusto, posicion) {
		posicion.drawElement(arbusto)
		wgame.whenCollideDo(arbusto, { g => arbusto.empuja(g) })
	}
	
	method drawVerticalBlock(x, y) {
		this.draw(new ArbustoDerecha(), new Position(x, y))
		this.draw(new ArbustoDerecha(), new Position(x, y+1))
		this.draw(new ArbustoIzquierda(), new Position(x+1, y))
		this.draw(new ArbustoIzquierda(), new Position(x+1, y+1))
	}
	
	method drawHorizontalBlock(x, y) {
		this.draw(new ArbustoArriba(), new Position(x, y))
		this.draw(new ArbustoArriba(), new Position(x+1, y))
		this.draw(new ArbustoAbajo(), new Position(x, y+1))
		this.draw(new ArbustoAbajo(), new Position(x+1, y+1))
	}
}