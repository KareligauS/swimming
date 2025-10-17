import java.util.ArrayList;

class GraphicsManager{
    ArrayList<IDisplayable> elements = new ArrayList<IDisplayable>();

    public void displayAll(){
        for (IDisplayable element: elements){
            element.display();
        }
    }

    public void add_all(ArrayList<IDisplayable> _elements){
        elements = _elements;
    }

    public void add(IDisplayable element){
        elements.add(element);
    }

    public void remove(IDisplayable element){
        elements.remove(element);
    }
}

abstract class IDisplayable{
    abstract void display();
}
