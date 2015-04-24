//Slider
class Slider
{
    //Fields
    int x;             //x origin
    int y;             //y origin (CENTERED!)
    int offx;          //x offset
    int offy;          //y offset
    int bWidth;        //Bar width
    int bHeight;       //Bar height
    int hWidth;        //Handle width
    int hHeight;       //Handle height
    float level;       //Current position of handle;
    
    boolean drag;     //True if being dragged.
    
    //Constructor
    Slider(int _x, int _y)
    {
        //Based on parameters.
        x = _x;
        y = _y;
        offx = 400;
        offy = 0;
        
        //Preset widths and heights.
        bWidth = 100;
        bHeight = 4;
        hWidth = 10;
        hHeight = 25;
        
        //Start at 0.
        level = 0;
    }
    
    //Draw slider
    void display()
    {
        //Offset
        offx = width;
        offy = height;
        
        //Draw Bar
        stroke(128);
        strokeWeight(bHeight);
        line(
          offx + x,
          offy + y,
          offx + x + bWidth,
          offy + y);
        
        //Draw Handle
        rectMode(CENTER);  //Set Rectmode
        fill(0);
        noStroke();
        rect(
            map(
                level,
                0,
                1,
                offx + x,
                offx + x + bWidth),
            offy + y,
            hWidth,
            hHeight,
            5);
        rectMode(CORNER);  //Reset Rectmode
    }
    
    void makeDrag()
    {
        if(
            mouseX + 5 > offx + x &&  
            mouseX - 5 < offx + x + bWidth &&
            mouseY - 5 < offy + y + hHeight / 2 &&
            mouseY + 5 > offy + y - hHeight / 2)
        drag = true;
    }
    
    void undoDrag()
    {
        drag = false;
    }
    
    void move()
    {
        if(drag)
            level = float(mouseX - x - offx) / bWidth;
        if(level < 0)
            level = 0;
        if(level > 1)
            level = 1;
    }
}
