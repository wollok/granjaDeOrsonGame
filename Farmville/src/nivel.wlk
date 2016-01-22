import wollok.game.*
import granjero.*
import elementos.*
import exceptions.*
import factories.*

object nivel {

	method configure() {
		var mensaje = "¡Al fin, granero querido!"
		
		arbustoFactory.drawVerticalBlock(5, 7)
		arbustoFactory.drawHorizontalBlock(7, 5)

//		try 
//			granjero.usarElemento()
//		catch e : MethodNotImplemented {
//			arbustoFactory.drawHorizontalBlock(7, 5)
//			mensaje = this.nivel3()
//		}
		
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
	
	method nivel2() = "Pasa por encima de algún elemento para agarrarlo y presiona la tecla 'ESPACIO' para usarlo. Al usarse la gorra, no pasa nada. Al usarse la espada se cosechan todos los cultivos del granjero. Los cultivos entienden en mensaje 'cosechate()'."

}