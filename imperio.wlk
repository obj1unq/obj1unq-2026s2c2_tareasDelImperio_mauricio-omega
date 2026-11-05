//======================================
//Clase abstracta Tarea, la herendan: Siembra y Mensaje
//======================================
class Tarea{
    method recursoQueProduce(tiempo) = 50 * (tiempo - self.desgaste(tiempo)) * self.esfuerzo()

    method desgaste(tiempo)
    method esfuerzo()

}       

//======================================
//Clase abstracta Siembra (hija de Tarea), la herendan: Valle y Terrazas
//======================================
class Siembra inherits Tarea {
    var property esfuerzo = 0  

    override method desgaste(tiempo) =  1 + (tiempo - self.horasDeJornadaNormal()).max(0)
    method horasDeJornadaNormal()
}

//Clase Valle (hija de Siembra)
class Valle inherits Siembra{
    var property estacion = epocaDeLluvia 

    override method recursoQueProduce(tiempo) = if(estacion.puedeSembrarse()) {super(tiempo)} else {0}

    method cambiarAEpocaSeca() {estacion = epocaDeSequia}
    method cambiarAEpocaDeLluvia() {estacion = epocaDeLluvia}

    override method horasDeJornadaNormal() = 8
}

//Objeto epocaDeLluvia y epocaDeSequia Unicamente usados para la clase Valle
object epocaDeLluvia {
    method puedeSembrarse() = false
}
object epocaDeSequia {
  method puedeSembrarse() = true
}

//Clase Terrazas (hija de Siembra)
class Terrazas inherits Siembra{
    override method recursoQueProduce(tiempo) = super(tiempo) * 3

    override method horasDeJornadaNormal() = 6
}


//======================================
//Clase Mensaje (hija de Tarea), la herendan: Imperial
//======================================
class Mensaje inherits Tarea {
    override method desgaste(tiempo) = tiempo / 4
    override method esfuerzo() = 1.4

}

//======================================
//Clase Imperial (hija de Mensaje)
//======================================
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