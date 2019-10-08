import wollok.game.*
import wollok.lib.*
import wollok.mirror.*

class Ovni{
	var xi
    var property position
    var property tick
	var property image="ovnic.png"
	 	
	 	method mataOvni()=false
	 	method movete() {
		if(self.llegasteAbajo())
		position=game.at(xi,16)
		else
		position = position.down(1)
	}
	method llegasteAbajo(){
		return position==game.at(xi,0)
}
	method morite(){
		position=game.at(xi,16)
	}
}
