class CircleSheet
{
    ArrayList<Circle> circles;
     
    CircleSheet()
    {
        circles = new ArrayList<Circle>(); 
    }
    
    void add(
        float _x,
        float _y,
        float _r,
        float _t)
    {
        circles.add(new Circle(
            _x,
            _y,
            _r,
            _t));
    }
    
    void display()
    {
        for(Circle i : circles)
        {
            i.display();
        }    
    }
    
    //Delete one circle close to a given position vector.
    void delete(PVector compare)
    {
        PVector circleVector;  //Pvector of a circle's position.
        
        //For each circle.
        for(int i = 0; i < circles.size(); ++i)
        {
            circleVector = new PVector(circles.get(i).x, circles.get(i).y);
            
            //If circle is a radius away, delete it.
            if(PVector.sub(compare, circleVector).mag() < r)
            {
                circles.remove(i);
            }
        } 
    }
    
    //Deletes all circles.
    void reset()
    {
        circles = new ArrayList<Circle>(); 
    }
    
    //Deletes the most recent circle.
    void undo()
    {
        if(circles.size() > 0)
            circles.remove(circles.size() - 1);      
    }
}
