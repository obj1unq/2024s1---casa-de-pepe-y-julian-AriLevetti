object casaDePepeYJulian {

	var viveres = 50
	var dineroParaReparaciones = 0
	var montoReparacion = 0
	var cuentaDeLaCasa = corriente

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

	method cuentaDeLaCasa(_cuentaDeLaCasa) {
		cuentaDeLaCasa = _cuentaDeLaCasa
	}

	method cuentaDeLaCasa() {
		return cuentaDeLaCasa
	}

}

// cuentas bancarias
object corriente {

	var saldo = 0

	method saldo() {
		return saldo
	}

	method extraerDinero(dinero) {
		saldo -= dinero
	}

	method depositarDinero(dinero) {
		saldo += dinero
	}

}

object conGastos {

	var saldo = 0
	var costoOperacion = 20

	method saldo() {
		return saldo
	}

	method extraerDinero(dinero) {
		saldo -= dinero
	}

	method depositarDinero(dinero) {
		saldo += (dinero - self.costoOperacion())
	}

	method costoOperacion(_costoOperacion) {
		costoOperacion = _costoOperacion
	}

	method costoOperacion() {
		return costoOperacion
	}

}

object combinada {

	var saldo = 0
	var primaria = corriente
	var secundaria = corriente

	method saldo() {
		return self.saldoPrimaria() + self.saldoSecundaria()
	}

	method primaria(_primaria) {
		primaria = _primaria
	}

	method primaria() {
		return primaria
	}

	method secundaria(_secundaria) {
		secundaria = _secundaria
	}

	method secundaria() {
		return secundaria
	}

	method saldoPrimaria() {
		return primaria.saldo()
	}

	method saldoSecundaria() {
		return secundaria.saldo()
	}

	method depositarDinero(dinero) {
		primaria.depositarDinero(dinero)
	}

	method extraerDinero(dinero) {
		if (primaria.saldo() >= dinero) {
			primaria.extraerDinero(dinero)
		} else {
			secundaria.extraerDinero(dinero)
		}
	}

}

