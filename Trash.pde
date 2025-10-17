public enum TrashActorStateType{
    STATIC, THROW, FALL
}

class TrashBag extends TrashActor {
    Circle hitbox;
    Trash trash = new Trash();

    public TrashBag(Vector2 initialPos){
        transform.SetPosition(initialPos);
        hitbox = new Circle(#333333, 50, initialPos);
        hitbox.transform.SetParent(transform);
    }

    public void display(){
        trash.display(transform.GetGlobalPosition().x, transform.GetGlobalPosition().y);
        hitbox.display();
    }
}

class Trash {
    public Trash(){}

    void display(float trashX, float trashY) {
      stroke(0);
      fill(#82BF00);
      ellipse(trashX, trashY-25, 40, 15);
  
      fill(#716E6E);
      rect(trashX, trashY, 30, 50);
  
      rect(trashX-10, trashY, 5, 40);
      rect(trashX, trashY, 5, 40);
      rect(trashX+10, trashY, 5, 40);
  
      rect(trashX, trashY-35, 40, 10);
      rect(trashX, trashY-40, 10, 5);
    }
  }

abstract class TrashActor extends Actor{
    private TrashActorState _state;

    public TrashActor(){
        SetState(TrashActorStateType.FALL);
    }

    abstract void display();

    public void update(Settings settings){
        _state.HandleUpdate(settings);
    }

    public void SetState(TrashActorStateType stateType){
        switch(stateType){
          case STATIC:
            _state = new TrashStaticState(this);
            break;
          case FALL:
            _state = new TrashFallState(this);
            break;
          case THROW:
            _state = new TrashThrowState(this);
            break;
        }
    
        _state.HandleStateChanged();
    }
}

abstract class TrashActorState{
    protected TrashActor _instance;

    public TrashActorState(TrashActor instance){
        _instance = instance;
    }

    abstract void HandleUpdate(Settings settings);
    abstract void HandleStateChanged();
}

public class TrashStaticState extends TrashActorState{
    public TrashStaticState(TrashActor instance){
        super(instance);
    }

    void HandleStateChanged(){
        //NotImplemented
    }

    void HandleUpdate(Settings settings){
        //Nothing
    }
}

public class TrashFallState extends TrashActorState{
    public TrashFallState(TrashActor instance){
        super(instance);
    }

    void HandleStateChanged(){
        //NotImplemented
    }

    void HandleUpdate(Settings settings){
        _instance.AddOffset(new Vector2(0, settings.globalGravity));
    }
}

public class TrashThrowState extends TrashActorState{
    public TrashThrowState(TrashActor instance){
        super(instance);
    }

    void HandleStateChanged(){
        //NotImplemented
    }

    void HandleUpdate(Settings settings){
        //Nothing
    }
}
