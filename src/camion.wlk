import cosas.*

object camion {
	const property cosas = []
	var property peso = 1000
	var property pesoMax = 2500
	var property cargaActual = knightRider
	
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}
	
	method descargar(cosa){
		cosas.remove(cosa)
	}
	method pesoTotal(){
		return peso + cargaActual.peso()
	}
	method excedidoDeCarga(){
		return self.pesoTotal() > pesoMax
	}
	method objetosPeligrosos(nivel){
		return cargaActual.peligrosidad() > nivel
	}
	method objetosMasPeligrososQue(cosa){
		cosas.filter({carga => carga.nivelPeligrosidad() > cosa.nivelPeligrosidad()})
	}
	method puedeCircularEnRuta(nivelMaximoPeligrosidad){
		cosas.filter({carga => carga.nivelPeligrosidad() > nivelMaximoPeligrosidad}).isEmpty()
	}
	method cosaMasPesada(){
		return cosas.max({cosa => cosa.peso()})
	}
}
