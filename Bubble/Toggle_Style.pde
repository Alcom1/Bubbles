//Save button.
class ToggleStyle extends Toggle
{
    ToggleStyle()
    {
        super(
            55,
            topH / 2,
            80,
            30,
            
            color(220, 100, 100),
            color(102, 102, 102),
            color(130, 130, 230),
            color(102, 102, 102),
            
            color(240, 150, 150),
            color(102, 102, 102),
            color(180, 180, 250),
            color(102, 102, 102),
            
            color(255, 255, 255),
            color(102, 102, 102),
            color(255, 255, 255),
            color(102, 102, 102));
    }
    
    void display()
    {
        super.display();
        
        //Visual colors.
        color vStroke = color(0);
        
        switch(state)
        {
            case 0:
                vStroke = color(0);
                break;
                
            case 1:
                vStroke = color(255);
                break;
                
            case 2:
                vStroke = color(0);
                break;
        }
        
        //Draw visual.
        noFill();
        stroke(vStroke);
        strokeWeight(4);
        switch(style)
        {
            case 0:
                line(
                    cx - 30,
                    cy,
                    cx + 30,
                    cy);
                break;
            case 1:
                arc(
                    cx - 16,
                    cy,
                    15,
                    8,
                    radians(180),
                    radians(360));
                arc(
                    cx + 15,
                    cy,
                    15,
                    8,
                    radians(0),
                    radians(180));
                break;
        }            
    }
    
    void action()
    {
        switch(style)
        {
            case 0:
               style = 1;
               flow = true;
               break;
            case 1:
               style = 0;
               flow = false;
               break; 
        }
    } 
}
