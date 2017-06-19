/*
  Aquesta prova d'unitat detecta quan els ocells surten de la pantalla. 
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
    } else if (c == 0) {
      println("Ocell fora de la pantalla");
      println("Valor c: " + c);
      image(img, 50, 50);
    }
    
  }
}