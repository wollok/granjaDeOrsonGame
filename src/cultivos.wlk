import granjero.*

class Maiz inherits Cultivo { 
	constructor() = super("maiz", 150)
}

class Trigo inherits Cultivo {
	constructor() = super("trigo", 100)
}

class Tomate inherits Cultivo {
	constructor() = super("tomate", 50)
}


class Cultivo {
	var precio
	var nombre
	var etapa = semilla
	
	constructor(_nombre, _precio) {
		nombre = _nombre
		precio = _precio
	}

//////////////////////////////////////////////////////////////////////////////////////
///////////////////////////         CÓDIGO BASE           ////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
	
	method crece() { etapa.crece(this) }
	
	method cosechate() {
		granjero.sumaOro(etapa.oroPorCosecha(this))
		wgame.removeVisual(this)
	}
	
	method oroBase() = precio
	method getNombre() = nombre
	method setEtapa(_edad) { etapa = _edad }
	method getImagen() = etapa.getImagen(this)
}



// ETAPAS

object semilla {

	method crece(cultivo) { cultivo.setEtapa(bebe) } 

	method oroPorCosecha(_) = 0
	
	method getImagen(_) = "semilla.png"
}

object bebe {
	
	method crece(cultivo) { cultivo.setEtapa(adulto) } 
	
	method oroPorCosecha(cultivo) = cultivo.oroBase() / 2
	
	method getImagen(cultivo) = cultivo.getNombre() + "_bebe.png"
}

object adulto {
	
	method crece(_) { /* No hace nada */ } 
	
	method oroPorCosecha(cultivo) = cultivo.oroBase()
	
	method getImagen(cultivo) = cultivo.getNombre() + "_adulto.png"
}
