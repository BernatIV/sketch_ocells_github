// Classe que representa un ocell
class Ocell {
  float xPos;
  float yPos;
  float amplada;
  float alcada;
  int[] puntAleatori; // Ha de ser un enter per poder avaluar les condicions al mètode move(). 
  
  int copsColisionat = 0;
  
  
  
  Ocell (float xPos, float yPos, float amplada, float alcada) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.amplada = amplada;
    this.alcada = alcada;
    this.puntAleatori = new int[2];
    puntAleatori[0] = (int) (Math.random() * width);
    puntAleatori[1] = (int) (Math.random() * height);
  }
  
  void comprovarColisio() {
    
  }
  
  void move() {
    
    // Si el ratolí no està dins 
    // Si el ratolí no s'està clicant
    
    
    // CRIDAR MÈTODE COL·LISIÓ
    // Si hi ha alguna col·lisió 
    // --> multiplica per menys 1 les seves coordenades per canviar la posició a on va
    
    if (esAProp(xPos, yPos, amplada)) {
      if (copsColisionat == 0) {
        puntAleatori[0] = (int) (Math.random() * width);
        puntAleatori[1] = (int) (Math.random() * height);
      }
      copsColisionat++;
      
      if (copsColisionat > 30) {
        copsColisionat = 0;
      }
    }
    // --> La prova d'unitat podria arreglar això? Que si dos ocells s'enganxen 
    
    
    
    // Va cap a la posició random (puntAleatori[0]) i si ja hi ha arribat en busca un altre.
    if (puntAleatori[0] == (int) xPos) {
      //Posició X cap a on anava l'ocell
      // println("Posició aleatòria X: " + puntAleatori[0]);
      
      puntAleatori[0] = (int) (Math.random() * width);
      
    } else if ((int) puntAleatori[0] > xPos) {
      xPos++;
    } else if (puntAleatori[0] < xPos) {
      xPos--;
    }
    
    // Va cap a la posició random (puntAleatori[1]) i si ja hi ha arribat en busca un altre.
    if (puntAleatori[1] == (int) yPos) {
      // Posició Y cap a on anava l'ocell
      //println("Posició aleatòria Y: " + puntAleatori[1]);
      
      puntAleatori[1] = (int) (Math.random() * height);
    
    } else if (puntAleatori[1] > yPos) {
      yPos++;
    } else if (puntAleatori[1] < yPos) {
      yPos--;
    }
  }
  
  
  /*
  boolean hiHaColisio() {
    // PREGUNTA
    // Hi ha algun objecte dins un quadrat de (10px + el meu diametre) de costat on el centre és aquest objecte? 
    // (10px perquè és el radi màxim que pot tenir una circumferència). 
    
    float costat = 10 + amplada; // Costat d'aquest quadrat imaginari
    
    
    return true;
  }
  */
  
  void display () {
    fill(200);
    ellipse(xPos, yPos, amplada, alcada);
  }
  
}