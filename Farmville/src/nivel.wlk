import wollok.game.*
import granjero.*
import elementos.*
import exceptions.*
import factories.*

object nivel {

	method configTeclado() {
		var mensaje = "¡Al fin, granero querido!"
		
		arbustoFactory.drawHorizontalBlock(7, 5)
		arbustoFactory.drawVerticalBlock(5, 7)
		
		try 
			granjero.usarElemento()
		catch e : MethodNotImplemented {
			arbustoFactory.drawVerticalBlock(5, 3)
			mensaje = this.nivel2()
		}
		
		try 
			granjero.oro()
		catch e : MethodNotImplemented {
			arbustoFactory.drawHorizontalBlock(3, 5)
			mensaje = this.nivel1()
		}
		
		H.onPressCharacterSay{mensaje}
	}
	
	method nivel1() = "Presiona la tecla 'A' para saber cuántas monedas de oro tengo"
	
	method nivel2() = "Pasa por encima de algún elemento para agarrarlo y presiona la tecla 'ESPACIO' para usarlo"

}