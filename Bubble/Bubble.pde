import processing.pdf.*;

PGraphics pic;                //Image being worked on.
CircleSheet circles;          //Circles to be drawn.
BackDrop backDrop;            //Background elements.
PVector hunt;                 //Line to draw circles across.

int saveCount;                //Number for saved image.
int topH;                     //Height of the top UI.
int botH;                     //Height of the bottom UI.
int picW;                     //px width of the pic.
int picH;                     //px height of the pic.

float offY;                   //Vertical distance from the pic to the top/bottom of the screen.
float r;                      //Radius of the drawn circle.
float t;                      //Thickness of the drawn circle.
float d;                      //Distance between circles.
float scale;                  //Scale of the image.

int mousePX;                  //Recorded mouseX position.
int mousePY;                  //Recorded mouseY position.

Boolean drag;                 //True if mouse is being dragged.
Boolean mod;                  //True if mouse is modded to appear as a circle.
Boolean flow;                 //True if follow style is being used.

Button save;                  //Save button.
Button undo;                  //Undo button.
Button dele;                  //Delete button.
Toggle styl;                  //Style toggle.

ArrayList<Slider> sliders;    //Array of menu sliders

//Setup
void setup()
{
    //Window and drawing settings.
    size(1000, 800);
    frame.setResizable(true);
    imageMode(CENTER);
    ellipseMode(RADIUS);
    
    //Initialize variables.
    saveCount = 0;
    topH = 80;
    botH = 80;
    picW = 2200;
    picH = 1700;
    offY = topH + 30;
    r = 25;
    t = 5;
    d = 100;
    
    //Instantiate objects
    pic = createGraphics(picW, picH, PDF, "bubble-sheet_" + saveCount + ".pdf");
    pic.ellipseMode(RADIUS);
    circles = new CircleSheet();
    backDrop = new BackDrop();
    hunt = new PVector(0, 0);
    
    //Initialize states.
    drag = false;
    mod = false;
    flow = true;
    
    //Instantiate buttons.
    save = new ButtonSave();
    undo = new ButtonUndo();
    dele = new ButtonDelete();
    styl = new ToggleStyle();
    
    //Instantiate sliders.
    sliders = new ArrayList<Slider>();
    sliders.add(new Slider(
        -265,
        -60));
    sliders.add(new Slider(
        -265,
        -20));
    sliders.get(0).level = .2;
    sliders.get(1).level = 1;
}

//Draw.
void draw()
{
    //Set slider values.
    r = (int)(sliders.get(0).level * 40 + 10);
    d = 2 * (int)((sliders.get(1).level * 80 + 20) / 2);
    
    //Refresh.
    background(164);
    
    //Draw
    backDrop.drawCanvas();
    backDrop.drawBotUI();
    backDrop.drawTopUI();

    //Change mouse appearance if it is over the screen.
    if(checkPos(mouseX, mouseY))
        modMouse(); 
    else
        unModMouse();
   
    //Buttons 
    save.display();
    save.check();
    undo.display();
    undo.check();
    dele.display();
    dele.check();
    styl.display();
    styl.check();
    
    //Display sliders.
    for(Slider i : sliders)
    {
        i.move();
        i.display();
    }      
    
    //Drag and draw circles.
    if(flow)
    {
        PVector moveTo = new PVector(mouseX - hunt.x, mouseY - hunt.y);  //Direction to move the hunt towards.    
        
        //If the hunt is less than its maximum travel distance, do not move,
        if(drag && moveTo.mag() > d * scale)
        {
            moveTo.setMag(d * scale);   //Set maginitude of the direction vector.
            hunt.add(moveTo);           //Move hunt.
            addCircle(hunt.x, hunt.y);  //Add a new circle. 
        }
    }
    else
    {
        //Draw drag line while dragging.
        if(drag)
        {
            stroke(0, 0, 255, 128);
            strokeWeight(2);
            line(
                mousePX,
                mousePY,
                mouseX,
                mouseY);
        }      
    }
}

//If the mouse is pressed.
void mousePressed()
{
    if(mouseButton == LEFT)
    {
        //Move Sliders.
        for(int i = 0; i < sliders.size(); ++i)
        {
            sliders.get(i).makeDrag(); 
        }
        
        //Start drag line if
        if(!drag)
        {
            drag = true;
            mousePX = mouseX;
            mousePY = mouseY;
            hunt.x = mouseX;
            hunt.y = mouseY;
        }
        
        //Add a circle.
        addCircle(mouseX, mouseY);
        
        //Button presses.
        save.press();
        undo.press();
        dele.press();
        styl.press();      
    }
    
    //Delete circle.    
    if(mouseButton == RIGHT)
    {
        circles.delete(getPos(mouseX, mouseY));
    }
}

//If the mouse is released.
void mouseReleased()
{
    //Release Sliders.
    for(int i = 0; i < sliders.size(); ++i)
    {
        sliders.get(i).undoDrag(); 
    }
    
    //End drag line.
    if(drag)
    {
        drag = false;
        
        //If straight style.
        if(!flow)
        {
            //Beam to draw circles across.
            PVector beam = new PVector(
                mouseX - mousePX, 
                mouseY - mousePY);
            
            PVector subBeam = PVector.mult(PVector.div(beam, beam.mag()), d * scale);  //Incremental beam.
            PVector superBeam = subBeam.get();  //Stack of incremental beams.
            
            //While superbeam isn't longer than the main beam.
            while(superBeam.mag() < beam.mag())
            {
                //Add circle to the end of the superbeam.
                addCircle(
                    mousePX + superBeam.x,
                    mousePY + superBeam.y);
                superBeam.add(subBeam);  //Add incremental beam to superbeam.
            }          
        }
    }
    
    //Button actions.
    if(save.release())
        save.action();
    if(undo.release())
        undo.action();
    if(dele.release())
        dele.action();
    if(styl.release())
        styl.action();
}

//Adds a circle to the canvas.
void addCircle(float x, float y)
{
    //If mouse is on pic.
    if(checkPos(x, y))
    {
        //Add a circle.
        circles.add(
            map(
                x, 
                width / 2 - picW * scale / 2, 
                width / 2 + picW * scale / 2, 
                0, 
                picW),
            map(
                y, 
                height / 2 - picH * scale / 2, 
                height / 2 + picH * scale / 2, 
                0, 
                picH),
            r,
            t);
    }
}

//Modifies the appearance of the mouse when the mouse is over the pic.
boolean checkPos(float x, float y)
{
    //Mapped values for comparison with pic.
    float testX = 
        map(
            x, 
            width / 2 - (picW - 2 * r - t) * scale / 2, 
            width / 2 + (picW - 2 * r - t) * scale / 2, 
            0, 
            1);
    float testY = 
        map(
            y, 
            height / 2 - (picH - 2 * r - t) * scale / 2, 
            height / 2 + (picH - 2 * r - t) * scale / 2, 
            0, 
            1);
            
    //If mouse is over the canvas, change the cursor to a circle.
    if(
        testX > 0 &&
        testX < 1 &&
        testY > 0 &&
        testY < 1)
    {
        return true;
    }
    
    return false;
}

PVector getPos(float x, float y)
{
    return new PVector(
        map(
            x, 
            width / 2 - picW * scale / 2, 
            width / 2 + picW * scale / 2, 
            0, 
            picW),
        map(
            y, 
            height / 2 - picH * scale / 2, 
            height / 2 + picH * scale / 2, 
            0, 
            picH));        
}

void modMouse()
{
    //Draw circle at mouse. Radius and stroke match the
    noCursor();
    noFill();
    stroke(0, 0, 0, 128);
    strokeWeight(t * scale);
    ellipse(
        mouseX,
        mouseY,
        r * scale,
        r * scale);
    strokeWeight(t * scale * 1.5);
    point(
      mouseX,
      mouseY);
}

void unModMouse()
{
    //Mod is false.
    mod = false;
        
    //Default cursor.
    cursor(ARROW);   
}


