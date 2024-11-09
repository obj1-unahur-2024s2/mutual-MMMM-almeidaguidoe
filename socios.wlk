import viajes.*

class Socio {
    const property actividadesRealizadas = []
    const maximoDeActividades
    const property edad
    const idiomasQueHabla = []

    method esAdoradorDelSol() = actividadesRealizadas.all({a => a.sirveParaBroncearse()})
    method actividadesEsforzadas() = actividadesRealizadas.filter({a => a.implicaEsfuerzo()})

    method realizarActividad(actividad) {
        if (actividadesRealizadas.size() == maximoDeActividades) {
            throw new DomainException(message="Se alcanzó el máximo de actividades a realizar")
        } else {
            actividadesRealizadas.add(actividad)
        }
    }
    method leGustaActividad(actividad)
}

class SocioTranquilo inherits Socio {
    override method leGustaActividad(actividad) = actividad.dias() >= 4
}

class SocioCoherente inherits Socio {
    override method leGustaActividad(actividad) = 
        (self.esAdoradorDelSol() and actividad.sirveParaBroncearse()) or
        (actividad.implicaEsfuerzo())
}

class SocioRelajado inherits Socio {
    override method leGustaActividad(actividad) = actividad.idiomas().intersection(idiomasQueHabla).size() >= 1
}