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

    override method validarAplicarTarea(tarea) {
        super(tarea)
        if(!self.siAplicaTareaProduciraMasQue(tarea, self.cantidadDeRecurosASuperar())){
            self.error("Solo puede realizar una tarea que produzca más recursos que el establecido: " + self.cantidadDeRecurosASuperar())
        }
    }
    method siAplicaTareaProduciraMasQue(tarea, cantidad) = tarea.recursoQueProduce(self.tiempo()) > cantidad
    method cantidadDeRecurosASuperar() = 500
}


//======================================
//Clase Ayllus
//======================================
class Ayllus {
    const colcas = #{}

    //Conocer la mejor Colca de un Ayllu para un habitante
    method mejorColcaPara(habitante) = colcas.max({colca => colca.recursosQueProducePorTodasLasTareas(habitante)})

    //Conocer las Colcas suaves de un Ayllu para un habitante
    method colcasSuavesPara(habitante) = colcas.filter({colca => colca.esColcaSuavePara(habitante)})

    //Conocer las tareas más exigentes del Ayllu para un habitante
    method tareasMasExigentesPara(habitante) = colcas.map({colca => colca.tareaMasExigentePara(habitante)})
} 

class Colca {
    const tareas = #{}

    method recursosQueProducePorTodasLasTareas(habitante) = tareas.sum({tarea => tarea.recursoQueProduce(habitante.tiempo())})

    method esColcaSuavePara(habitante) = self.hayTareaQueProduzcaMenosQuePara(habitante)
    method hayTareaQueProduzcaMenosQuePara(habitante) = tareas.any({tarea => tarea.recursoQueProduce(habitante.tiempo()) < self.cantidadInferiorAProducir()})
    method cantidadInferiorAProducir() = 200

    method tareaMasExigentePara(habitante) = tareas.max({tarea => tarea.recursoQueProduce(habitante.tiempo())})
}

