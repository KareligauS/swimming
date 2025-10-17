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
        chair.display();

        if (gameplay.successCount == 10 || gameplay.successCount == 5){
            feed.display(true);
        }
        
        if (gameplay.failCount == 1){
            feed.display(false);
        }
    }

    public void connect(ArrayList<IDisplayable> _elements){
        elements = _elements;
    }
}

abstract class IDisplayable{
    abstract void display();
}
