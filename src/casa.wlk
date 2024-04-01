object casaDePepeYJulian {

	var viveres = 50
	var dineroParaReparaciones = 0
	var montoReparacion = 0

	method aumentarMontoDeReparacion(monto) {
		montoReparacion += monto
	}

	method montoReparacion() {
		return montoReparacion
	}

	method viveres(_viveres) {
		viveres = _viveres
	}

	method viveres() {
		return viveres
	}

	method tieneViveresSuficientes() {
		return self.viveres() > 40
	}

	method hayQueReparar() {
		return self.montoReparacion() > 0
	}

	method laCasaEstaEnOrden() {
		return self.tieneViveresSuficientes() and not self.hayQueReparar()
	}

}

