object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
}

object paqueteDeLadrillos{
	var property cantidadLadrillos = 1 
	method peso() { return  2 * cantidadLadrillos }
	method nivelPeligrosidad() { return 2 }
	
}

object arenaAGranel{
	var property peso = 10
	method nivelPeligrosidad() { return 1 }
	
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
	
	}
	
object contenedorPortuario{
	const property contenedor = []
	var sumaPesos = contenedor.forEach({cosa=> sumaPesos += cosa.peso()})
		
	method agregarAlContenedor(unaCosa){
			contenedor.add(unaCosa)
		}
	method sacarDelContenedor(unaCosa){
			contenedor.remove(unaCosa)
		}
	
	method peso(){
		return 100 + sumaPesos
	}
	method  nivelPeligrosidad(){
		return (contenedor.max({cosa => cosa.nivelDepeligrosidad()}).nivelDePeligrosidad())
	}
	
}

object residuosRadioactivos{
	
}

	
