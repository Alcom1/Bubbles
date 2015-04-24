//Undo button.
class ButtonUndo extends Button
{
    ButtonUndo()
    {
        super(
            125,
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
        color vFill = color(0);
        color vStroke = color(0);
        
        switch(state)
        {
            case 0:
                vFill = color(0);
                vStroke = color(0);
                break;
                
            case 1:
                vFill = color(255);
                vStroke = color(255);
                break;
                
            case 2:
                vFill = color(0);
                vStroke = color(0);
                break;
        }
        
        //Draw visual.
        noFill();
        stroke(vStroke);
        strokeWeight(4);
        arc(
            cx + 1,
            cy,
            8,
            8,
            radians(180),
            radians(405));
        fill(vFill);
        noStroke();
        triangle(
            cx - 1,
            cy,
            cx - 11,
            cy,
            cx - 6,
            cy + 8);
    }
    
    void action()
    {
        circles.undo();
    } 
}
