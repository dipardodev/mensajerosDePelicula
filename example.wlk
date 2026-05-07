// example.wlk
// example.wlk
// example.wlk
// example.wlk
// example.wlk
// example.wlk
// example.wlk
// example.wlk
// example.wlk
// example.wlk
// example.wlk
// example.wlk
// example.wlk
// example.wlk

//paquete:
object paquete {
  var destino = matrix
  var pago = false
  method destino(){return destino}
  method cambiarDestino(elemento){destino = elemento}
  method puedeEntregarse(mensajero){
    return self.destino().puedePasar(mensajero)}
  method pagar(){pago = !pago}  
  method estaPago(){return pago}  
}
object paquetito {
  method estaPago(){return true}
   method puedeEntregarse(){
    return true}
}

object paqueton{
  const destinos = []
  var precio = 0
  var pago = 0
  method agregarDestino(elemento){
    destinos.add(elemento)
  }
  method aumentarPrecio(){precio = destinos.size() * 100}
  method pagoParcial(elemento){
    pago += elemento
  }
  method precio(){return precio}
  method pago(){return pago}
  method estaPago(){
    return self.pago() == self.precio()
  }
  method esEnvio(mensajero){return self.estaPago() and destinos.all({p => p.puedePasar(mensajero)})}
}


//Destinos posibles:
object puetebroclyng {
  method puedePasar(elemento){
    return elemento.peso() <= 1000
  }
}
object matrix {
  method puedePasar(elemento){
    elemento.puedeLlamar()
  }
}
//Mensajeros posibles:
object roberto {
  var movilidad = bicicleta

  method movilidad(){return movilidad}

  method cambiarMovilidad(elemento){movilidad = elemento}

  method peso(){return 90}
  method pesoTotal(){return self.peso() + self.movilidad().peso()}
  method dinero(){return 0}
  method puedeLlamar(){return false}
}

object chuck{
  method peso(){return 80}
  method puedeLlamar(){return true}
}

object neo {
  var credito = 10
  method peso(){return 0}
  method credito(){return credito}
  method cargarCredito(elemento){credito = elemento}
  method puedeLlamar(){return self.credito() > 0}
}

object bicicleta {
  method peso(){return 5}
}
object camion{
  var acoplados = 1
  method peso(){return self.cantidadAcoplados() * 500}
  method cantidadAcoplados(){return acoplados}
  method sumarUnAcoplado(){acoplados += 1}
  method restarUnAcoplado () {acoplados -= 1}
}


object empresa {
  const mensajeros = []
  method contratarMensajero(mensajero){mensajeros.add(mensajero)}
  method despedirMensajero(mensajero){mensajeros.remove(mensajero)}
  method despedirATodos(){mensajeros.removeAll()} 
  method esGrande(){return mensajeros.size() > 2}
  method puedeSerEntregadoPorElPrimer(){return paquete.estaPago() and paquete.puedeEntregarse(mensajeros.first())}
  method pesoDelUltimoEmpleado(){return mensajeros.last().peso()}


}