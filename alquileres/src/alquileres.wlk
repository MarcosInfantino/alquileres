class Departamento{
	var habitaciones
	var superficie
	var artefactos
	var barrio
	
	method habitaciones()=habitaciones
	method esEspacioso(){
		if (habitaciones<3)
			return superficie>45
		else
			return superficie>75
	}
	method consumoElectrico(){
		return habitaciones*300+ artefactos.map({artefacto=>artefacto.consumo()}).sum()
	}
	method artefactoMasAlto(){
		return artefactos.max({accesorio=>accesorio.altura()})
	}
	method tieneCalefaccion(){
		return artefactos.any({artefacto=>artefacto.daCalor()})
	}
	method cantArtefactosAltoConsumo(){
		return artefactos.filter({artefacto=>artefacto.consumo()>400}).size()
	}
	method barrio()=barrio
	method cantArtefactos(){
		return artefactos.size()
	}
	method superficie()=superficie
	
}

object estufaCuarzo{
	method consumo()=700
	method altura()=60
	method daCalor()=true
}

class AireAcondicionado{
	var frigorias
	var frioCalor
	method consumo(){
		return frigorias/4
	}
	method altura(){
		return 40+frigorias/100
	}
	method daCalor(){
		return frioCalor
	}
}

class Mesa{
	var alturaPatas
	var bordeLuminoso
	method consumo(){
		if (bordeLuminoso)
			return 80
		else
			return 0
	}
	method altura(){
		if (bordeLuminoso)
			return alturaPatas+25
		else
			return alturaPatas+20
	}
	method daCalor()=false
}

const mesa1= new Mesa(alturaPatas=80,bordeLuminoso=true)
const mesa2= new Mesa(alturaPatas=25,bordeLuminoso=false)
const mesa3= new Mesa(alturaPatas=75,bordeLuminoso=false)

const aire1=new AireAcondicionado(frigorias=2400,frioCalor=false)
const aire2=new AireAcondicionado(frigorias=3000,frioCalor=false)
const aire3=new AireAcondicionado(frigorias=1000,frioCalor=true)

const depto1= new Departamento(habitaciones=5,superficie=120,artefactos=[estufaCuarzo,mesa1,aire1],barrio="Hurlingham")

const depto2= new Departamento(habitaciones=2,superficie=50,artefactos=[aire2,mesa2],barrio="Villa Tesei")

const depto3= new Departamento(habitaciones=4,superficie=60,artefactos=[aire3,mesa3],barrio="Villa Tesei")



class Inmobiliaria{
	var departamentos
	
	method departamentosFamiliares(){
		return departamentos.filter({depto=>depto.habitaciones()>2})
	}
	
	method barrios(){
	return ((departamentos.map({depto=>depto.barrio()})).asSet())
	}

	
	method toleraInvierno(){
		return departamentos.any({depto=>depto.tieneCalefaccion()})
	}
	method certificaBajoConsumo(consumo){
		return departamentos.all({depto=>depto.consumoElectrico()<=consumo})
	}
	method barrioDelDeptoMasGrande(){
		return departamentos.max({depto=>depto.superficie()}).barrio()
	}
	method cantDeptosMas2Accesorios(){
		return departamentos.filter({depto=>depto.cantArtefactos()>2}).size()
	}
	method consumoTotalDeptosCompactos(){
		return departamentos.filter({depto=>depto.superficie()<70}).map({depto=>depto.consumoElectrico()}).sum()
	}
	method deptosCompatibles(depto1){
		return departamentos.filter({depto2=>(depto1.barrio()==depto2.barrio()) && ((depto1.superficie()-depto2.superficie()).abs()<10)})
	}
	
	
}

const inmobiliaria1= new Inmobiliaria(departamentos=[depto1,depto2,depto3])