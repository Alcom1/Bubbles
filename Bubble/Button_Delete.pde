//Delete button.
class ButtonDelete extends Button
{
    ButtonDelete()
    {
        super(
            170,
            topH / 2,
            30,
            30,
            color(220, 220, 220),
            color(102, 102, 102),
            color(190, 190, 190),
            color(102, 102, 102),
            color(220, 180, 040),
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
        stroke(vStroke);
        strokeWeight(4);
        line(
          cx - 10,
          cy - 10,
          cx + 10,
          cy + 10);
        line(
          cx + 10,
          cy - 10,
          cx - 10,
          cy + 10);            
    }
    
    void action()
    {
        circles.reset();
    } 
}
