import wollok.game.*
import exceptions.*
import factories.*
import granjero.*
import granero.*
import cultivos.*

object nivel {

	method configure() {
		var mensaje = "¡Al fin, granero querido!"
		var cultivos = [new Maiz(), new Trigo(), new Tomate()]
			
		try {
			granero.rega()
			granero.cosecha()
			granero.planta(new Maiz())
			granjero.restaOro(granjero.oro())
		}
		catch e : MethodNotImplemented {
			arbustoFactory.drawVerticalBlock(5, 7)
			mensaje = this.nivel4()
		}
		catch e {}
		
		try {
			cultivos.forEach{ it =>
				it.crece()
				it.cosechate()
			}
			granjero.restaOro(granjero.oro())
		}
		catch e : MethodNotImplemented {
			arbustoFactory.drawHorizontalBlock(7, 5)
			mensaje = this.nivel3()
		}
		catch e {}
		
		try 
			granjero.cosecha(null)
		catch e : MethodNotImplemented {
			arbustoFactory.drawVerticalBlock(5, 3)
			mensaje = this.nivel2()
		}
		catch e {}
		
		try 
			granjero.oro()
		catch e : MethodNotImplemented {
			arbustoFactory.drawHorizontalBlock(3, 5)
			mensaje = this.nivel1()
		}
		catch e {}
		
		H.onPressCharacterSay{mensaje}
	}
	
	method nivel1() = "Presiona la tecla 'A' para saber cuántas monedas de oro tengo"
	
	method nivel2() = "Pasa por encima de algún elemento para agarrarlo y presiona la tecla 'ESPACIO' para usarlo. Al usarse la gorra, no pasa nada. Al usarse la espada se cosechan todos mis cultivos, los cuales entienden en mensaje 'cosechate()'"

	method nivel3() = "Presiona la tecla 'R' para regar los cultivos"

	method nivel4() = "Entra al granero para BLABLALABAL"
}