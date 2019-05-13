object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method cantidadDeBultos() { return 1}  
	method cambioPorSerCargado() {}
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	method cantidadDeBultos() { return 2} 
	method cambioPorSerCargado() { transformadoEnAuto = false}
}

object paqueteDeLadrillos{
	var property cantidadLadrillos = 1 
	method peso() { return  2 * cantidadLadrillos }
	method nivelPeligrosidad() { return 2 }
	method cantidadDeBultos() { if (cantidadLadrillos <100) { return 1}
									else if (cantidadLadrillos < 301 && cantidadLadrillos > 101) {return 2}
										else { return 3}

	}
	method cambioPorSerCargado() {cantidadLadrillos += 12}
	
}

object arenaAGranel{
	var property peso = 10
	method nivelPeligrosidad() { return 1 }
	method cantidadDeBultos() { return 1} 
	method cambioPorSerCargado() { peso += 20}
}


object bateriaAntiaerea{
	var property tieneMisiles = true
	method peso(){
		if (tieneMisiles) { return 300}
			else { return 200} 
	} 
	method nivelPeligrosidad() {
		if (tieneMisiles) { return 100}
			else { return 0}
	}
	method cantidadDeBultos() { if (tieneMisiles) { return 2}
									else { return 1}
	} 
	method cambioPorSerCargado() {tieneMisiles = true}
	
}
	
object contenedorPortuario{
	const property contenedor = []
	var cantidadBultos = 1
	
		
	method agregarAlContenedor(unaCosa){
			contenedor.add(unaCosa)
		}
	method sacarDelContenedor(unaCosa){
			contenedor.remove(unaCosa)
		}
	
	method peso(){
		return contenedor.sum({cosa=> cosa.peso()}) + 100
	}
	method  nivelPeligrosidad(){
		return (contenedor.max({cosa => cosa.nivelDepeligrosidad()}).nivelDePeligrosidad())
	}
    method cantidadDeBultos() { return contenedor.sum({cosa => cantidadBultos += cosa.cantidadDeBultos()}) }
    method cambioPorSerCargado() {
    	contenedor.foreach({cosas => cosas.cambioPorSerCargado()})
    }

}

object residuosRadioactivos{
	var property peso = 1
	method  nivelPeligrosidad(){return 200}
	method cantidadDeBultos() { return 1} 
	method cambioPorSerCargado(){ peso += 20}
}

object embalajeDeSeguridad {
	var property cosaEnvuelta = residuosRadioactivos
	method peso() {
		return cosaEnvuelta.peso()
	}
	method nivelPeligrosidad(){
		return  cosaEnvuelta.nivelPeligrosidad() / 2
	}
	method cantidadDeBultos() { return 2} 
	method cambioPorSerCargado(){}
}

	
