import atacantes.*
import wollok.game.*
object inicializar {
	
	
	method inicializarOvnis(ovnis){
		ovnis.forEach({ovni=>game.addVisual(ovni)})

ovnis.forEach({ovni=>game.onTick(ovni.tick(),"movimiento",{ovni.movete()})})

ovnis.forEach({ovni=> game.whenCollideDo(ovni,{cosa=> if (cosa.mataOvni())
	    									ovni.morite()
	    })})
	}
	method empezamos(){
	 const ovni1= new Ovni(position= game.at(0,14),xi=0,tick=300)
	 const ovni2= new Ovni(position= game.at(1,16),xi=1,tick=800)
	 const ovni3= new Ovni(position = game.at(2,16),xi=2,tick=400)
	 const ovni4= new Ovni(position = game.at(3,15),xi=3,tick=1000)
	 const ovni5= new Ovni(position= game.at(4,16),xi=4,tick=800)
	 const ovni6= new Ovni(position = game.at(5,15),xi=5,tick=300)
	 const ovni7= new Ovni(position = game.at(6,15),xi=6,tick=400)
	 const ovni8= new Ovni(position = game.at(7,14),xi=7,tick=1000)
	 const ovni9= new Ovni(position = game.at(8,16),xi=8,tick=200)
	 const ovni10= new Ovni(position = game.at(9,14),xi=9,tick=300)

	 var ovnis=[ovni1,ovni2,ovni3,ovni4,ovni5,ovni6,ovni7,ovni8,ovni9,ovni10]
	 self.inicializarOvnis(ovnis)
}

	
}
