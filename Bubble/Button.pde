//General button class.
class Button
{
    int state;    //I wish there were enums.
    //0 == Default
    //1 == Mouseover
    //2 == Clicked
    
    float cx;    //Center x-coordinate.
    float cy;    //Center y-coordinate.
    float x;     //width
    float y;     //height
    
    color dFill;        //Default fill
    color dStroke;    //Default stroke
    color mFill;        //Mouseover fill
    color mStroke;    //Mouseover stroke
    color cFill;        //Click fill
    color cStroke;    //Click stroke
    
    //Constructor
    Button(
        float _cx,
        float _cy,
        float _x,
        float _y,
        color a,
        color b,
        color c,
        color d,
        color e,
        color f)
    {
        state = 0;
        
        cx = _cx;
        cy = _cy;
        x = _x;
        y = _y;
        dFill = a;
        dStroke = b;
        mFill = c;
        mStroke = d;
        cFill = e;
        cStroke = f;
    }
    
    //Displays the button.
    void display()
    {
        color tFill = color(0);    //Text color.
        
        //Change colors based on state and draw the button.
        rectMode(CENTER);
        switch(state)
        {
            case 0:
                fill(dFill);
                stroke(dStroke);
                strokeWeight(3);
                break;
                
            case 1:
                fill(mFill);
                stroke(mStroke);
                strokeWeight(3);
                break;
                
            case 2:
                fill(cFill);
                stroke(cStroke);
                strokeWeight(5);
                break;
        }
        rect(
            cx,
            cy,
            x,
            y,
            5);
        rectMode(CORNER);
    }
    
    //If mouse isn't clicked, check for mouseover and change state to match.
    void check()
    {
        if(state != 2)
        {
            if(
             mouseX < cx + x / 2 &&
             mouseX > cx - x / 2 && 
             mouseY < cy + y / 2 &&
             mouseY > cy - y / 2)
            {
                state = 1;
            }
            else
            {
                state = 0; 
            }
        }
    }
    
    //If mouseover, change mouse to clicked.
    void press()
    {
        if(
         mouseX < cx + x / 2 &&
         mouseX > cx - x / 2 && 
         mouseY < cy + y / 2 &&
         mouseY > cy - y / 2)
        {
            state = 2;
        }    
    }
    
    //Change state to 0. If mouseover, return true.
    boolean release()
    {
        boolean act = false;
        
        if(
         mouseX < cx + x / 2 &&
         mouseX > cx - x / 2 && 
         mouseY < cy + y / 2 &&
         mouseY > cy - y / 2)
        {
            act = true;
            state = 1;
        }            
        else
        {
            state = 0;
        }
        
        return act;
    }
    
    void action()
    {
        
    }
}
