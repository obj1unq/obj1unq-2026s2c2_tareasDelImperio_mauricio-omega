class Tarea{
    method recursoQueProduce(tiempo) = 50 * (tiempo - self.desgaste(tiempo)) * self.esfuerzo()

    method desgaste(tiempo)
    method esfuerzo()

}       

class Siembra inherits Tarea {
    var property esfuerzo = 0  

    override method desgaste(tiempo) {
        return 
            if(self.esJornadaNormal(tiempo)){
                1
            } else {
                0
            }
    }
    method esJornadaNormal(tiempo)
}

class valle inherits Siembra{
    var property esEpocaSeca = true 

    override method esJornadaNormal(tiempo) = tiempo < 8 && esEpocaSeca
}

class terrazas inherits Siembra{
    override method esJornadaNormal(tiempo) = tiempo <= 8
    override method recursoQueProduce(tiempo) = super(tiempo) * 3
}

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