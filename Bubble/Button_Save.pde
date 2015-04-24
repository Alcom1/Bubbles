//Save button.
class ButtonSave extends Button
{
    ButtonSave()
    {
        super(
            55,
            topH / 2,
            80,
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
        
        color tFill = color(0);    //Text color.
        
        switch(state)
        {
            case 0:
                tFill = color(0);
                break;
                
            case 1:
                tFill = color(255);
                break;
                
            case 2:
                tFill = color(0);
                break;
        }
        
        //Draw text.
        fill(tFill);
        textSize(22);
        textAlign(CENTER, CENTER);
        text("SAVE", cx, cy - 2);        
    }
    
    void action()
    {
        //Loop through existing files. If a numbered file exists, don't overwrite it, go to the next number.
        boolean saved = false;
        while(!saved)
        {
            File file = new File("bubble-sheet_" + saveCount + ".pdf");
            
            if(!file.exists())
            {
                pic.beginDraw();
                    //Circle style.
                    pic.background(255);
                    pic.fill(0, 0, 0, 0);
                    pic.stroke(0);
                    for(Circle i : circles.circles)
                    {
                        pic.strokeWeight(i.t);
                        pic.ellipse(
                            i.x,
                            i.y,
                            i.r,
                            i.r);
                    }
                    pic.dispose();
                pic.endDraw();   
                
                saved = true;  //Ends the loop once file is written.            
            }
                       
            saveCount++;  //Increment file number.
                              
            pic = createGraphics(picW, picH, PDF, "bubble-sheet_" + saveCount + ".pdf");
            pic.ellipseMode(RADIUS);     
        }        
    } 
}
