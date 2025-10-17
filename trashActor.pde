public enum TrashActorStateType{
    STATIC, THROW, FALL
}

class TrashBag extends TrashActor {
    Circle hitbox;

    public TrashBag(Vector2 initialPos){
        hitbox = new Circle(#333333, 30, initialPos);
        hitbox.transform.SetParent(transform);
    }

    public void display(){
        hitbox.display();
    }
}

abstract class TrashActor extends Actor{
    private TrashActorState _state;

    public TrashActor(){
        SetState(TrashActorStateType.FALL);
    }

    abstract void display();

    public void update(){
        _state.HandleUpdate();
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

    abstract void HandleUpdate();
    abstract void HandleStateChanged();
}

public class TrashStaticState extends TrashActorState{
    public TrashStaticState(TrashActor instance){
        super(instance);
    }

    void HandleStateChanged(){
        //NotImplemented
    }

    void HandleUpdate(){
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

    void HandleUpdate(){
        _instance.AddOffset(new Vector2(0, globalGravity));
    }
}

public class TrashThrowState extends TrashActorState{
    public TrashThrowState(TrashActor instance){
        super(instance);
    }

    void HandleStateChanged(){
        //NotImplemented
    }

    void HandleUpdate(){
        //Nothing
    }
}
