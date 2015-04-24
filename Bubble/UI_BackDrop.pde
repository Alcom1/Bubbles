class BackDrop
{
    //Constructor
    BackDrop()
    {
     
    }
 
    //Draw the top UI background.
    void drawTopUI()
    {
        //Shadow
        fill(0, 0, 0, 10);
        noStroke();
        strokeWeight(0);
        boxShadow(
            0,
            0,
            width,
            topH,
            10);
            
        //Box
        fill(255);
        stroke(255);
        strokeWeight(0);
        rect(
            0,
            0,
            width,
            topH);    
    }
    
    //Draw the bottom UI background.
    void drawBotUI()
    {
        //Shadow
        fill(0, 0, 0, 10);
        noStroke();
        strokeWeight(0);
        boxShadow(
            0, 
            height - botH, 
            width, 
            botH,
            10);
            
        //Box
        fill(255);
        stroke(255);
        strokeWeight(0);
        rect(
            0, 
            height - botH, 
            width, 
            botH);
        
        //Text display box
        rectMode(CENTER);    //Set Rectmode
        fill(0);
        noStroke();
        rect(
            width - 78,
            height - 20,
            138,
            25,
            5);
        rect(
            width - 78,
            height - 60,
            138,
            25,
            5);
        rectMode(CORNER);
        
        //Text
        fill(255);
        textSize(16);
        textAlign(LEFT, CENTER);
        text("Diameter:", width - 142, height - 60 - 2);
        text("Distance:", width - 142, height - 20 - 2);
        text(nf(r * 2, 3, 0), width - 45, height - 60 - 2);
        text(nf(d, 3, 0), width - 45, height - 20 - 2);
    }
    
    //Draws the canvas and the image being edited.
    void drawCanvas()
    {
        //Calculate scale.
        scale = (height - offY * 2) / picH;
        
        //Limit scale.
        if(scale < .1)
            scale = .1;
        if(scale > 10)
            scale = 10;
        if(picW * scale > width * .9)
            scale = width * .9 / picW;
                
        //Shadow
        fill(0, 0, 0, 10);
        noStroke();
        strokeWeight(0);
        boxShadow(
            width / 2 - picW * scale / 2,
            height / 2 - picH * scale / 2,
            picW * scale,
            picH * scale,
            10,
            15);    
        
        //Transform and draw pic.
        pushMatrix();
            translate(width / 2, height / 2);
            scale(scale);
            fill(255);
            noStroke();
            rectMode(CENTER);
              rect(
                0,
                0,
                picW,
                picH);
            rectMode(CORNER);
        popMatrix();
        
        pushMatrix();
            translate(width / 2 - picW * scale / 2, height / 2 - picH * scale / 2);
            scale(scale);
            noFill();
            stroke(0);
            circles.display();
        popMatrix();
    }
    
    //Box shadow.
    void boxShadow(
        float sx,
        float sy,
        float x,
        float y,
        int w)
    {
        //Draw rectangles of decreasing size over the site for a shadow effect.
        for(int i = w; i > 0; i--)
        {
            rect(
                sx - i,
                sy - i,
                x + 2 * i,
                y + 2 * i);
        }
    }
    
    //Box shadow with radius.
    void boxShadow(
        float sx,
        float sy,
        float x,
        float y,
        int w,
        float round)
    {
        //Draw rectangles of decreasing size over the site for a shadow effect.
        for(int i = w; i > 0; i--)
        {
            rect(
                sx - i,
                sy - i,
                x + 2 * i,
                y + 2 * i,
                round);
        }
    } 
}
