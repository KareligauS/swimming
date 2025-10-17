import java.util.ArrayList;

class GraphicsManager{
    ArrayList<IDisplayable> elements = new ArrayList<IDisplayable>();

    public void displayAll(){
        displayStatic();

        for (IDisplayable element: elements){
            element.display();
        }
    }

    public void displayStatic(){
        trees[station].display();
        squ1.display();
        pool.display(0);
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
