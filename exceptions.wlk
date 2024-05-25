/* 
class MethodNotImplemented inherits Exception {

	constructor (methodName, aObject) = super("Falta implementar el método '" + methodName + "' en " + aObject) { }

}


object methodNotImplemented inherits Exception (message = "Falta implementar el método '") {

}
*/
class MethodNotImplemented inherits Exception {
	const methodName
	const anObject

	override method message() = "Falta implementar el método '" + methodName + "' en " + anObject  

}