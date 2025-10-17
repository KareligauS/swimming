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
        pool.display(1); // DO NOT FORGET TO ADD THE COUTNER
    }

    public void connect(ArrayList<IDisplayable> _elements){
        elements = _elements;
    }
}

abstract class IDisplayable{
    abstract void display();
}
