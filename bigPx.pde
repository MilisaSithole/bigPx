public class bigPx{
    color col;
    float w;
    float x;
    float y;

    public bigPx(color col, float w, float x, float y){
        this.col = col;
        this.w = w;
        this.x = x;
        this.y = y;
    }

    public void draw(){
        float yOff = w * 0.8;
        float xOff = w * 0.2;
        noStroke();
        fill(getR());
        rect(x + (xOff/6), y + (yOff/2), xOff, yOff);
        fill(getG());
        rect(x + (xOff/6) + (w/3), y + (yOff/2), xOff, yOff);
        fill(getB());
        rect(x + (xOff/6) + (2 * (w/3)), y + (yOff/2), xOff, yOff);
    }

    color getR(){
        return color(col >> 16 & 0xFF, 0, 0);
    }
    color getG(){
        return color(0, col >> 8 & 0xFF, 0);
    }
    color getB(){
        return color(0, 0, col & 0xFF);
    }
}
