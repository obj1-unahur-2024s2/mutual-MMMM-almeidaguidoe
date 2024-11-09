class Viaje {
  const property idiomas = []
  method agregarIdioma(idioma) {idiomas.add(idioma)}
  method implicaEsfuerzo()
  method sirveParaBroncearse()
  method dias()
  method esInteresante() = idiomas.size() > 1
  method esRecomendadaParaSocio(unSocio) =
    self.esInteresante() and unSocio.leGustaActividad(self) and not unSocio.actividadesRealizadas().contains(self)
}

class ViajeDePlaya inherits Viaje {
  const largoDePlaya
  override method dias() = largoDePlaya / 500
  override method implicaEsfuerzo() = largoDePlaya > 1200
  override method sirveParaBroncearse() = true
}

class ExcursionACiudad inherits Viaje {
  const atracciones
  override method dias() = atracciones / 2
  override method implicaEsfuerzo() = atracciones.between(5, 8)
  override method sirveParaBroncearse() = false
  override method esInteresante() = super() or atracciones == 5
}

class ExcursionACiudadTropical inherits ExcursionACiudad {
  override method dias() = super() + 1
  override method sirveParaBroncearse() = true
}

class SalidaDeTrekking inherits Viaje {
  const kilometrosDeSendero
  const diasDeSolPorAnio
  override method dias() = kilometrosDeSendero / 50
  override method implicaEsfuerzo() = kilometrosDeSendero > 80
  override method sirveParaBroncearse() = 
    diasDeSolPorAnio > 200 or (diasDeSolPorAnio.between(100, 200) and kilometrosDeSendero > 120)
  override method esInteresante() = super() and diasDeSolPorAnio > 140
}

class ClaseDeGimnasia inherits Viaje (idiomas = ["español"]) {
  override method dias() = 1
  override method implicaEsfuerzo() = true
  override method sirveParaBroncearse() = false
  override method esRecomendadaParaSocio(unSocio) = unSocio.edad().between(20, 30)
}