/**
  Que quan se separen del ratolí i surten de la pantalla, doncs comprovar això. 
  
  
  Que quan dos ocells passen l'un per sobre de l'altre canviïn de color, 
  o solucionar quan dos ocells s'enganxen. 
  
  
*/


class PUnitat {
  PImage img;
  
  PUnitat() {
    img = loadImage("bird2.png");
  }
  
  
  void comprovarColor(int x, int y) {
    
    color c = get(x, y);
    
    color cBackground = color(40, 40, 40);
    color cOcell = color(200, 200, 200);
    
    
    if (c == cBackground) {
      println("Tot va bé");
    } else if (c == cOcell) {
      println("Hi ha hagut una col·lisió entre ocells!");
    } else {
      println("Ocell fora de la pantalla");
      image(img, 1350, 50);
    }
    
  }
}