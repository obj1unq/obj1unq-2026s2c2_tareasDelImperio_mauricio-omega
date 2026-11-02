//Clase abstracta
class Tarea{
    method recursoQueProduce(tiempo) = 50 * (tiempo - self.desgaste(tiempo)) * self.esfuerzo()

    method desgaste(tiempo)
    method esfuerzo()

}       

//Clase hija de Tarea y abstracta
class Siembra inherits Tarea {
    var property esfuerzo = 0  

    override method desgaste(tiempo) =  1 + (tiempo - self.horasDeJornadaNormal()).max(0)
    method horasDeJornadaNormal()
}

class Valle inherits Siembra{
    var property estacion = epocaDeLluvia 

    override method desgaste(tiempo) = if(estacion.puedeSembrarse()) {super(tiempo)} else {0}

    method cambiarAEpocaSeca() {estacion = epocaDeSequia}
    method cambiarAEpocaDeLluvia() {estacion = epocaDeLluvia}

    override method horasDeJornadaNormal() = 8
}

object epocaDeLluvia {
    method puedeSembrarse() = false
}
object epocaDeSequia {
  method puedeSembrarse() = true
}

class Terrazas inherits Siembra{
    override method recursoQueProduce(tiempo) = super(tiempo) * 3

    override method horasDeJornadaNormal() = 6
}


//Clase hija de tarea y no abstracta
class Mensaje inherits Tarea {
    override method desgaste(tiempo) = tiempo / 4
    override method esfuerzo() = 1.4

}

class Imperial inherits Mensaje {
    override method desgaste(tiempo) = (super(tiempo) - 2).max(1)
    override method esfuerzo() = 1.8
}





//diagramas estaticos:
    /*solo los metodos principales 
    Estereotipos<<type>>
                <<object>>
                <<abstract>>
    ojo con las flechas:
    linea recta con flecha triangula vacio herencia
    linea recta punteada con triangulo vacio implementacion de un tipo
    linea recta de forma de flecha -> conocimiento atributo
    linea recta punteada de forma - - - > dependencia/uso (parámetro)
    */