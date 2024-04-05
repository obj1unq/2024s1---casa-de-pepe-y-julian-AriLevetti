object casaDePepeYJulian {

	var viveres = 50
	var montoReparacion = 0
	var cuentaDeLaCasa = corriente
	var property estrategiaDeAhorro = full
	var property calidadDeViveres = 1

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

	method aumentarViveres(nuevaCantidad) {
		viveres += nuevaCantidad
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

	method saldoCuentaDeLaCasa() {
		return cuentaDeLaCasa.saldo()
	}

	method gastar() {
		cuentaDeLaCasa.extraerDinero(montoReparacion)
	}

	method nuevoGastoDeLaCasa(tipoDeGasto) {
		self.aumentarMontoDeReparacion(tipoDeGasto.costo())
	}

	method mantenimiento() {
		estrategiaDeAhorro.procedimiento()
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

//Tipo de Gastos
object estructura {

	method costo() {
		return 1000
	}

}

object jardin {

	method costo() {
		return 500
	}

}

object muebles {

	method costo() {
		return 100
	}

}

//Estrategias de ahorro
object minimoEIndispensable {

	var property casa = casaDePepeYJulian

	method procedimiento() {
		if (not casa.tieneViveresSuficientes()) {
			self.viveresAl40()
		}
	}

	method viveresAl40() {
		casa.gastar(self.monto())
		casa.viveres(40)
	}

	method monto() {
		return (40 - casa.viveres()) * casa.calidadDeViveres()
	}

}

object full {

	var property casa = casaDePepeYJulian
	const calidad = 5
	var correspondeMantenimiento = false

	method procedimiento() {
		if (casa.laCasaEstaEnOrden()) {
			self.viveresAl100()
		} else {
			self.viveresAumentan40()
		}
	}

	method viveresAl100() {
		casa.gastar(self.montoAl100())
		casa.viveres(100)
	}

	method viveresAumentan40() {
		casa.gastar(self.monto40())
		casa.aumentarViveres(40)
	}

	method montoAl100() {
		return (100 - casa.viveres()) * calidad
	}

	method monto40() {
		return 40 * calidad
	}

	method hacerMantenimiento() {
		if (correspondeMantenimiento) {
			casa.gastar()
		}
	}

	method correspondeMantenimiento() {
		if (casa.saldoCuentaDeLaCasa() - casa.montoReparacion() >= 1000) {
			correspondeMantenimiento = true
		}
	}

}

