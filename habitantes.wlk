class Persona{
    var property energia = 0

    method aplicarTarea(tarea) {
        self.validarAplicarTarea(tarea)
        energia -= self.energiaQuePierdeEnTarea(tarea)
    }
    method validarAplicarTarea(tarea){
        if(!self.tieneEnergiaParaRealizar(tarea)){
            self.error("Solo se puede realizar una tarea cuando hay energia suficiente.")
        }
    }
    method tieneEnergiaParaRealizar(tarea) = self.energiaQuePierdeEnTarea(tarea) <= energia
    method energiaQuePierdeEnTarea(tarea) = tarea.recursoQueProduce(self.tiempo()) / self.indiceDeResistencia()  

    method tiempo()
    method indiceDeResistencia() 
}

class Campesino inherits Persona {
    var property tiempo = 0
    override method indiceDeResistencia() = 10
}

class Elite inherits Persona {
    override method energiaQuePierdeEnTarea(tarea) = super(tarea) - 5
    override method tiempo() = 10
    override method indiceDeResistencia() = 12

}