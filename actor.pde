abstract class Actor extends IDisplayable{
    public Transform transform = new Transform();

    public void AddOffset(Vector2 offset){
        Vector2 newPos = transform.localPosition.Sum(offset);
        transform.SetPosition(newPos);
    }

    abstract void display();
}

public class ActorManager{
    ArrayList<TrashBag> trashBags = new ArrayList<TrashBag>();
    ArrayList<IDisplayable> displays = new ArrayList<IDisplayable>();

    public void createTrash(Vector2 initialPos){
        TrashBag bag = new TrashBag(initialPos);
        trashBags.add(bag);
        addDisplay(bag);
    }

    public void deleteTrash(TrashBag bag){
        trashBags.remove(bag);
        removeDisplay(bag);
    }

    private void addDisplay(IDisplayable display){
        displays.add(display);
    }

    private void removeDisplay(IDisplayable display){
        displays.remove(display);
    }
    
    public ArrayList<IDisplayable> getDisplays(){
        ArrayList<IDisplayable> actors = new ArrayList<IDisplayable>();
        for (TrashActor el : trashBags){
            actors.add(el);
        }

        return actors;
    }
}

class TrashAnimationManager{
    ArrayList<TrashBag> trashBags;

    public TrashAnimationManager(ArrayList<TrashBag> bags){
        trashBags = bags;
    }

    public void addBag(TrashBag trash){
        trashBags.add(trash);
    }

    public void removeBag(TrashBag trash){
        trashBags.remove(trash);
    }

    public void update(){
        for (TrashBag trash : trashBags){
            trash.update();
        }
    }
}
