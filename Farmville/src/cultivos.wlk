import granjero.*

class Maiz inherits Cultivo { 
	constructor() = super("corn", 150)
}

class Trigo inherits Cultivo {
	constructor() = super("wheat", 100)
}

class Tomaco inherits Cultivo {
	constructor() = super("tomaco", 50)
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
		granjero.sumarOro(etapa.oroPorCosecha(this))
		wgame.removeVisual(this)
	}
	
	method oroBase() = precio
	method imagenCultivoAdulto() = nombre + "_adult.png"
	method imagenCultivoNinio() = nombre + "_baby.png"
	method setEtapa(_edad) { etapa = _edad }
	method getImagen() = etapa.getImagen(this)
}



// ETAPAS

object semilla {

	method crece(cultivo) { cultivo.setEtapa(bebe) } 

	method oroPorCosecha(_) = 0
	
	method getImagen(_) = "dead_plant.png"
}

object bebe {
	
	method crece(cultivo) { cultivo.setEtapa(adulto) } 
	
	method oroPorCosecha(cultivo) = cultivo.oroBase() / 2
	
	method getImagen(cultivo) = cultivo.imagenCultivoNinio()
}

object adulto {
	
	method crece(_) { "No hace nada" } 
	
	method oroPorCosecha(cultivo) = cultivo.oroBase()
	
	method getImagen(cultivo) = cultivo.imagenCultivoAdulto()
}
