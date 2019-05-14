import cosas.*

object camion {
	const property cosas = []
	var property peso = 1000
	var property pesoMax = 2500
	var totalBultos = 0
	
	method cargar(unaCosa) {
		cosas.add(unaCosa)
		unaCosa.cambioPorSerCargado()
	}
	
	method descargar(cosa){
		cosas.remove(cosa)
	}
	method pesoTotal(){
		return cosas.sum({carga =>  carga.peso()}) + peso
	}
	method excedidoDeCarga(){
		return self.pesoTotal() > pesoMax
	}
	method objetosPeligrosos(nivel){
		return cosas.filter({carga => carga.nivelPeligrosidad() > nivel})
	}
	method objetosMasPeligrososQue(cosa){
		return cosas.filter({carga => carga.nivelPeligrosidad() > cosa.nivelPeligrosidad()})
	}
	method puedeCircularEnRuta(nivelMaximoPeligrosidad){
		return (cosas.filter({carga => carga.nivelPeligrosidad() > nivelMaximoPeligrosidad}).isEmpty())
	}
	method cosaMasPesada(){
		return cosas.max({carga => carga.peso()})
	}
	method tieneAlgoQuePesaEntre(min, max){
		return not (cosas.filter({carga => carga.peso()>min && carga.peso()<max}).isEmpty())
	}
	method totalBultos(){
		return cosas.sum({carga => totalBultos+= carga.cantidadDeBultos()})
		
	}
	method pesos(){
		return cosas.map({carga => carga.peso()})
	}
}
