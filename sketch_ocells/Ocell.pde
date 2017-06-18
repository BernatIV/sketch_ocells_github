// Classe que representa un ocell
class Ocell {
  // Atributs
  float xPos;
  float yPos;
  float amplada;
  float alcada;
  int[] puntAleatori; // Ha de ser un enter per poder avaluar les condicions al mètode move(). 
  
  int copsColisionat = 0;
  float diametreMaxim;
  float auxAmplada;
  float auxAlcada;
  
  
  int[] colorOcell = { 200, 200, 200 };
  int[] colorAux;
  int[] colorRed = { 255, 0, 0 };
  int[] colorBlue = { 0, 0, 255 };
  
  
  // Constructor
  Ocell (float xPos, float yPos, float amplada, float alcada) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.amplada = amplada;
    this.alcada = alcada;
    this.diametreMaxim = 30; // Per quan es clica el ratolí
    
    this.puntAleatori = new int[2];
    puntAleatori[0] = (int) (Math.random() * width);
    puntAleatori[1] = (int) (Math.random() * height);
  }
  
  
  
  // Establim el diamentre a la mida màxima
  void setAmpladaMaxima() {
    auxAmplada = amplada;
    amplada = diametreMaxim;
    
    auxAlcada = alcada;
    alcada = diametreMaxim;
  }
  
  // Tornem el diametre a la mida original
  void setAmplada() {
    amplada = auxAmplada;
    alcada = auxAlcada;
  }
  
  
  
  // Canviem el color a vermell
  void setColorEvil() {
    colorAux = colorOcell;
    colorOcell = colorRed;
  }
  
  // Canviem el color a blau
  void setColorChill() {
    colorAux = colorOcell;
    colorOcell = colorBlue;
  }
  
  // Canviem el color
  void setColor() {
    colorOcell = colorAux;
  }
  
  
  // Ocells volen cap a direccions aleatòries
  void move() {
    
    // Es comunica amb els altres ocells
    if (esAProp(xPos, yPos, amplada)) {
      if (copsColisionat == 0) {
        puntAleatori[0] = (int) (Math.random() * width);
        puntAleatori[1] = (int) (Math.random() * height);
      }
      
      // Esperem unes iteracions perquè les partícules tinguin temps a separar-se. 
      copsColisionat++;
      if (copsColisionat > 30) {
        copsColisionat = 0;
      }
    }
    
    
    // Moure's cap a la posició X (puntAleatori[0]) i si ja hi ha arribat en busca un altre.
    if (puntAleatori[0] == (int) xPos) {
      puntAleatori[0] = (int) (Math.random() * width);
    } else if ((int) puntAleatori[0] > xPos) {
      xPos++;
    } else if (puntAleatori[0] < xPos) {
      xPos--;
    }
    
    // Moure's cap a la posició Y (puntAleatori[1]) i si ja hi ha arribat en busca un altre.
    if (puntAleatori[1] == (int) yPos) {
      puntAleatori[1] = (int) (Math.random() * height);    
    } else if (puntAleatori[1] > yPos) {
      yPos++;
    } else if (puntAleatori[1] < yPos) {
      yPos--;
    }
  }
  
  
  // Ocells volen cap al ratolí
  void moveToMouse() {
    puntAleatori[0] = mouseX;
    puntAleatori[1] = mouseY;
    
    if (puntAleatori[0] > xPos) {
      xPos = xPos + 2;
    } else if (puntAleatori[0] < xPos) {
      xPos = xPos - 2;
    }
    
    if (puntAleatori[1] > yPos) {
      yPos = yPos + 2;
    } else if (puntAleatori[1] < yPos) {
      yPos = yPos - 2;
    }
  }
  
  
  // Ocells volen en direcció contrària al ratolí
  void moveAway() {
    puntAleatori[0] = mouseX;
    puntAleatori[1] = mouseY;
    
    if (puntAleatori[0] > xPos) {
      xPos = xPos - 2;
    } else if (puntAleatori[0] < xPos) {
      xPos = xPos + 2;
    }
    
    if (puntAleatori[1] > yPos) {
      yPos = yPos - 2;
    } else if (puntAleatori[1] < yPos) {
      yPos = yPos + 2;
    }
  }
  
  
  
  // Volem que els ocells prenguin les seves pròpies direccions altre cop. 
  void novesPosicions() {
    puntAleatori[0] = (int) (Math.random() * width);
    puntAleatori[1] = (int) (Math.random() * height);
  }
  
  
  
  void display () {
    fill(colorOcell[0], colorOcell[1], colorOcell[2]);
    ellipse(xPos, yPos, amplada, alcada);
  }
}