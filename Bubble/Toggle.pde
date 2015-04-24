//General toggle class.
class Toggle
{
    int state;    //I wish there were enums.
    //0 == Default
    //1 == Mouseover
    //2 == Clicked
    
    int style;
    //0 == style 0;
    //1 == style 1;
    
    float cx;    //Center x-coordinate.
    float cy;    //Center y-coordinate.
    float offx;  //Offset center x-coordinate.
    float x;     //width
    float y;     //height
    
    color dFill0;       //Default fill
    color dStroke0;     //Default stroke
    color dFill1;       //Default fill
    color dStroke1;     //Default stroke
    color mFill0;        //Mouseover fill
    color mStroke0;      //Mouseover stroke
    color mFill1;        //Mouseover fill
    color mStroke1;      //Mouseover stroke
    color cFill0;        //Click fill
    color cStroke0;      //Click stroke
    color cFill1;        //Mouseover fill
    color cStroke1;      //Mouseover stroke
    
    //Constructor
    Toggle(
        float _offx,
        float _cy,
        float _x,
        float _y,
        
        color a0,
        color b0,
        color a1,
        color b1,
        
        color c0,
        color d0,
        color c1,
        color d1,
        
        color e0,
        color f0,
        color e1,
        color f1)
    {
        state = 0;
        style = 1;
        
        offx = _offx;
        
        cx = width - offx;
        cy = _cy;
        x = _x;
        y = _y;
        
        dFill0 = a0;
        dStroke0 = b0;
        dFill1 = a1;
        dStroke1 = b1; 
        
        mFill0 = c0;
        mStroke0 = d0;
        mFill1 = c1;
        mStroke1 = d1;
        
        cFill0 = e0;
        cStroke0 = f0;
        cFill1 = e1;
        cStroke1 = f1;
    }
    
    //Displays the button.
    void display()
    {
        cx = width - offx;
        color tFill = color(0);    //Text color.
        
        //Change colors based on state and draw the button.
        rectMode(CENTER);
        switch(state)
        {
            case 0:
            switch(style)
            {
                case 0: 
                    fill(dFill0);
                    stroke(dStroke0);
                    strokeWeight(3);
                    break;
                case 1:
                    fill(dFill1);
                    stroke(dStroke1);
                    strokeWeight(3);
                    break;                    
            }
            break;
                
            case 1:
            switch(style)
            {
                case 0: 
                    fill(mFill0);
                    stroke(mStroke0);
                    strokeWeight(3);
                    break;
                case 1:
                    fill(mFill1);
                    stroke(mStroke1);
                    strokeWeight(3);
                    break;                    
            }
            break;
                
            case 2:
            switch(style)
            {
                case 0: 
                    fill(cFill0);
                    stroke(cStroke0);
                    strokeWeight(3);
                    break;
                case 1:
                    fill(cFill1);
                    stroke(cStroke1);
                    strokeWeight(3);
                    break;                    
            }
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
