import processing.video.*;

float pxSize = 8;
Capture cam;
color bgCol = color(25);

void setup() {
    // size(800, 800);
    fullScreen();
    background(bgCol);

    cam = new Capture(this, int(width/pxSize), int(height/pxSize));
    cam.start();
}

void draw() {
    background(0);

    if(cam.available())
        cam.read();
    drawPxs(cam);
}

void keyPressed() {
    if(keyCode == UP)
       pxSize++;
    if(keyCode == DOWN)
        pxSize = max(1, pxSize-2);
    updateCam();
}

void drawPxs(PImage img){
    for(int i = 0; i <= img.width + pxSize; i++){
        for(int j = 0; j <= img.height + pxSize; j++){
            color pxCol = img.get(img.width - i, j);
            bigPx px = new bigPx(pxCol, pxSize, i * pxSize, j * pxSize);
            px.draw();
        }
    }
}

void updateCam(){
    cam.stop();
    cam = new Capture(this, int(width/pxSize), int(height/pxSize));
    cam.start();
}