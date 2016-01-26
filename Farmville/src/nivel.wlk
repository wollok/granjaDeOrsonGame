import wollok.game.*
import granjero.*
import granero.*
import elementos.*
import exceptions.*
import factories.*

object nivel {

	method configure() {
		var mensaje = "¡Al fin, granero querido!"
		
		try 
			null
//			granero.hazLoTuyo()
		catch e : MethodNotImplemented {
			arbustoFactory.drawVerticalBlock(5, 7)
			mensaje = this.nivel4()
		}
		
		try 
			null
//			granjero.rega()
		catch e : MethodNotImplemented {
			arbustoFactory.drawHorizontalBlock(7, 5)
			mensaje = this.nivel3()
		}
		
		try 
			null
//			granjero.usarElemento()
		catch e : MethodNotImplemented {
			arbustoFactory.drawVerticalBlock(5, 3)
			mensaje = this.nivel2()
		}
		
		try 
			null
//			granjero.oro()
		catch e : MethodNotImplemented {
			arbustoFactory.drawHorizontalBlock(3, 5)
			mensaje = this.nivel1()
		}
		
		H.onPressCharacterSay{mensaje}
	}
	
	method nivel1() = "Presiona la tecla 'A' para saber cuántas monedas de oro tengo"
	
	method nivel2() = "Pasa por encima de algún elemento para agarrarlo y presiona la tecla 'ESPACIO' para usarlo. Al usarse la gorra, no pasa nada. Al usarse la espada se cosechan todos mis cultivos, los cuales entienden en mensaje 'cosechate()'"

	method nivel3() = "Presiona la tecla 'R' para regar los cultivos"

	method nivel4() = "Entra al granero para BLABLALABAL"
}