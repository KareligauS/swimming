import java.util.ArrayList;

class GraphicsManager{
    GameplayManager gameplay;
    ArrayList<IDisplayable> elements = new ArrayList<IDisplayable>();

    GraphicsManager(GameplayManager _gameplay){
        gameplay = _gameplay;
    }

    public void displayAll(){
        displayStatic();

        for (IDisplayable element: elements){
            element.display();
        }
    }

    public void displayStatic(){
        trees[station].display();
        squ1.display();
        pool.display(gameplay.failCount); 
    }

    public void connect(ArrayList<IDisplayable> _elements){
        elements = _elements;
    }
}

abstract class IDisplayable{
    abstract void display();
}
