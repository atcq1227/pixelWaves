PImage img;

int phase = 0;

void setup() {
  size(1024, 768);
  img = loadImage("amb.jpg");
}

void draw() {
  image(img, 0, 0);
  
  loadPixels();
  
  manipulatePix();
  
  updatePixels();
}

void manipulatePix() {
  
  //walk through pixel array and manipulate color based on period of waves
  for(int i = 0; i < width; i++) {
    for(int j = 0; j < height; j++) {
      int pos = i*j;
      
      int sinFactor = abs((int)(sin((width/1000) + phase)*255));
      int cosFactor = abs((int)(sin((width/1000) + phase)*255));
      int tanFactor = abs((int)(tan((width/1000) + phase)*255));
      
      color sin = color(sinFactor, cosFactor, tanFactor);
      
      pixels[pos] = pixels[pos]*sin;
    }
  }
}

void mousePressed() {
  //randomly change phase of waves
  phase += (int)(random(0,1000));
}