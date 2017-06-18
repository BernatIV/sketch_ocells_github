/*
Practiquem com escriure objectes, arrays d'objectes i que hi hagi comunicació entre els objectes. 
*/

// Definim l'array
Ocell[] ocells;

void setup() {
  size(840, 520);
  noStroke();
  
  // Instanciem l'array
  ocells = new Ocell[30];
  
  for (int i = 0; i < ocells.length; i++) {
    float diametre = (float) Math.random() * 20 + 10;
    ocells[i] = new Ocell((float) Math.random() * width, (float) Math.random() * height, diametre, diametre);
  }
  
}

void draw() {
  background(40);
  
  for (Ocell ocell : ocells) {
    ocell.display();
    ocell.move();
  }
  
  // Canviem quantes iteracions volem que faci la funció draw() per segon.
  // frameRate(30); // Per defecte són 60
}

// Mètode perquè un ocell sàpiga si està molt a prop o tocant d'un alte. 
boolean esAProp(float xPos, float yPos, float amplada) {
  // busquem tots els ocells que estiguin dins un quadrat imaginari amb costat (diàmetre ocell + diàmetre de l'altre ocell). 

  for (Ocell ocell : ocells) {
    float sumaDosRadis = (amplada / 2) + (ocell.amplada / 2);
    
    // Com sé que l'ocell no és ell mateix? 
    if (amplada != ocell.amplada) { // Voldrà dir que no és el propi objecte amb qui s'està comparant
      // Si està dins el quadrat a l'eix de les x
      if (ocell.xPos > xPos - sumaDosRadis && ocell.xPos < xPos + sumaDosRadis) {
        // i està dins el quadrat a l'eix de les y
        if (ocell.yPos > yPos - sumaDosRadis && ocell.yPos < yPos + sumaDosRadis) {
          println("Suma dels dos radis: " + sumaDosRadis);
          return  true;
        }
      }
    }
  }
  
  return false;
}


/*
 - Que quan passis el ratolí per sobre vagin més lentament cap a tu. (Només si el ratolí està dins el canvas. Sinó que es comportin normal). 
 
 - I quan apretis el ratolí es facin el màxim de grans i vagin cap a tu més ràpid. (Aquesta opció fer-la a l'examen amb el codi i la prova d'unitat ja feta. 
 
 
  ES COMUNIQUIN ENTE ELLES
  Quan estan a prop les unes de les altres. 
 

*/

/*
  Enviar-li a l'antonio un correu: 
  
  si el meu programa fa 
  - això 
  - això 
  - i això
  ja estaria bé per a l'examen?
  
  I passar-li el programa
*/