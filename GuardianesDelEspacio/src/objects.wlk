import wollok.game.*
import wollok.lib.*
import wollok.mirror.*
import atacantes.*

object nave {
	var property position=game.center()
	var property image= "nave.jpg"
	method right(){
		position=position.right(1)
	}
	method left(){
		position=position.left(1)
	}
	method down(){
		position=position.down(1)
	}
	method up(){
		position=position.up(1)
	}
	method mataOvni()=false
	method morite(){
		image="gameover.png"
		position=game.center()
		alienContador.deboParar(true)
	}
	
	method disparar(){
		
		var bala = new Bala(position=self.position().up(1))
		bala.disparate()
		
	}	
}

class Bala{
	
	var property position
	var property image= "bala2.png"
	
	method mataOvni()=true
	method explota(){
		image="explosion bala.png"
	
		
	}
	method disparate(){
		game.addVisual(self)
		game.onTick(100,"bala sube",{position=position.up(1)})
		
		game.whenCollideDo(self,{elemento=>self.explota()})
		
	}
}



object alienContador{
	var segundos=0
	var property deboParar=false
	var property position =game.at(3,19)
	var property image="alienContador.png"
	method incrementarSegundos(){
		segundos++
	}
	method dameElTiempo(){
		return segundos.toString()
	}
}

// poner las carpetas
// poner la logica de contador en alien y sacarlo de la nave

