class Circle
{
    float x;    //X position.
    float y;    //Y position.
    float r;    //radius.
    float t;    //diameter.
    
    //Constructor.
    Circle(
        float _x,
        float _y,
        float _r,
        float _t)
    {
        x = _x;
        y = _y;
        r = _r;
        t = _t; 
    }
    
    void display()
    {
        strokeWeight(t);
        ellipse(
         x,
         y,
         r,
         r); 
    }
}
