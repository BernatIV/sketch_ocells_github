/*
  Simulació del vol d'uns ocells. 
*/

// Definim l'array
Ocell[] ocells;


void setup() {
  size(1000, 650);
  noStroke();
  
  // Instanciem l'array i la PUnitat
  ocells = new Ocell[30];
  // pUnitat = new PUnitat();
  
  for (int i = 0; i < ocells.length; i++) {
    float diametre = (float) Math.random() * 20 + 10;
    ocells[i] = new Ocell((float) Math.random() * width, (float) Math.random() * height, diametre, diametre);
  }
}

void draw() {
  background(40);
  
  for (Ocell ocell : ocells) {
    ocell.display();
    
    if (mousePressed && mouseButton == LEFT) {
      ocell.moveToMouse();
    } else if (mousePressed && mouseButton == RIGHT) {
      ocell.moveAway();
    } else {
      ocell.move();
    }
  }
  
}



// Un ocell sàpiga si està molt a prop o tocant d'un alte. 
boolean esAProp(float xPos, float yPos, float amplada) {
  // busquem tots els ocells que estiguin dins un quadrat imaginari amb costat (diàmetre ocell + diàmetre de l'altre ocell). 

  for (Ocell ocell : ocells) {
    float sumaDosRadis = (amplada / 2) + (ocell.amplada / 2);
    
    // Com sé que l'ocell no és ell mateix? Li hauria de passar l'objecte en comptes dels atributs 
    if (amplada != ocell.amplada) { // Voldrà dir que no és el propi objecte amb qui s'està comparant
      // Si està dins el quadrat a l'eix de les x
      if (ocell.xPos > xPos - sumaDosRadis && ocell.xPos < xPos + sumaDosRadis) {
        // i està dins el quadrat a l'eix de les y
        if (ocell.yPos > yPos - sumaDosRadis && ocell.yPos < yPos + sumaDosRadis) {
          // println("Suma dels dos radis: " + sumaDosRadis);
          return  true;
        }
      }
    }
  }
  
  return false;
}


void mousePressed() {
  if (mouseButton == LEFT) {
    for (Ocell ocell : ocells) {
      ocell.setAmpladaMaxima();
      ocell.setColorEvil();
    }
  } else if (mouseButton == RIGHT) {
    for (Ocell ocell : ocells) {
      ocell.setAmpladaMaxima();
      ocell.setColorChill();
    }
  }
}


void mouseReleased() {
  if (mouseButton == LEFT) {
    for (Ocell ocell : ocells) {
      ocell.setAmplada();
      ocell.setColor();
      ocell.novesPosicions();
    }
  } else if (mouseButton == RIGHT) {
    for (Ocell ocell : ocells) {
      ocell.setAmplada();
      ocell.setColor();
      ocell.novesPosicions();
    }
  }
}

/*
  PER ACABAR: 
  
    Implementar l'objecte que es mou sol i es torna vermell si passa per sobre d'un altre objecte
    
    Fer una altra prova d'unitat. 
  
  
*/

/*
 
  PRENEN LES SEVES PRÒPIES DECISIONS
  
  ES COMUNIQUIN ENTE ELLES: Saben si estan a prop les unes de les altres. 
 
  PROVA D'UNITAT: Es crida des de l'objecte al mètode display(). 
  Comprova que els ocells no surtin del canvas.  

*/