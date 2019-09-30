/** First Wollok example */
class Persona {
	 var nombre
	 var home=[]
	 method tuitea(tuit){
	 	twitter.publicarTweet(tuit)
	 }
	 method agregarTweetHome(tuit){
	 	home.add(tuit)
	 }
	 method home(){
	 	return home
	 }
	 method nombre(){
	 	return nombre
	 }
	
}

const alex=new Persona(nombre="alex")

object policia{
	var registros=[]
	method investigar(tuit){
	registros.add(tuit)	
	}
	method registros(){
		return registros
	}
	
}
class Tweet{
	var persona
	var texto=[]
	var imagen=""
	var bytesImagen=0
	method persona(){
		return persona
	}
	method texto(){
		return texto
	}
	method serReportado(){
		policia.investigar(self)
	}
}

const tuit1=new Tweet(persona=alex,texto=["empanada"], imagen="empanada.png", bytesImagen=128)

object botBenito{
	var listaNegra=["empanada"]
	method revisarTweet(tuit){
		if (tuit.texto().any({palabra=>listaNegra.contains(palabra)}))
		tuit.serReportado()	
		
	}
}

class BotPublicidad{
	var nombre
	var palabraPuntual
	var mensaje
	var link
	method revisarTweet(tuit){
		const persona=tuit.persona()
		if(tuit.texto().contains(palabraPuntual))
		{const tuitBot=new Tweet (persona= nombre, texto=mensaje+link+["@"]+ [(persona.nombre())])
		persona.agregarTweetHome(tuitBot)
		self.tuitea(tuitBot)}
		}
	method tuitea(tuit){
		twitter.publicarTweet(tuit)
	}
}

const botEmpanadas=new BotPublicidad(palabraPuntual="empanada",mensaje=["Segui","a "],link=["empanadas" ,"showroom "],nombre="bot de empanadas")

class BotJuntaDatos{
	var palabraPuntual
	var tweetsGuardados=[]
	method revisarTweet(tuit){
		if(tuit.texto().contains(palabraPuntual))
			tweetsGuardados.add(tuit.texto())
	}
}

const botInvestigaEmpanadas=new BotJuntaDatos(palabraPuntual="empanada")

object twitter{
	var bots=[botBenito,botEmpanadas,botInvestigaEmpanadas]
	var tweets=[]
	method publicarTweet(tuit){
	tweets.add(tuit)
	if(tuit.texto().size() <16)
		bots.forEach({bot=>bot.revisarTweet(tuit)})	
		
	}
	method tweetsALaNada(){
		return tweets.filter({tuit=>!tuit.texto().contains("@")})
	}
	method tweets(){
		return tweets
	}
}