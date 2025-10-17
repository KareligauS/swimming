class GameSystem{
    GameplayManager gameplay;
    GraphicsManager graphics = new GraphicsManager();
    ActorManager actorMan = new ActorManager();
    InteractionManager interaction;

    public GameSystem(){
        gameplay = new GameplayManager(actorMan);
        interaction = new InteractionManager(gameplay);
        graphics.add_all(actorMan.displays);

        actorMan.createTrash(new Vector2(50, 50));
    }

    public void display(){
        graphics.displayAll();
        gameplay.update();
    }

    public void onClick(int x, int y){
        interaction.onClick(new Vector2((float)x, (float)y));
    }
}

class GameplayManager{
    ActorManager actorMan;
    TrashAnimationManager trashManager;
    int failCount = 0;
    int successCount = 0;
    float spawnY = 20;
    float crossLineY = 500;

    public GameplayManager(ActorManager _actorMan){
        actorMan = _actorMan;
        trashManager = new TrashAnimationManager(actorMan.trashBags);
    }

    public void onClick(Vector2 clickPos){
        ArrayList<TrashBag> toRemove = new ArrayList<TrashBag>();

        for (TrashBag el : trashManager.trashBags){
            if (el.hitbox.IsPointInCircle(clickPos)){
                successCount++;
                toRemove.add(el);
            }
        }

        for (TrashBag el : toRemove){
            actorMan.deleteTrash(el);
        }
    }

    public void update(){
        trashManager.update();
        processTrashBags();
    }

    public void processTrashBags(){
        ArrayList<TrashBag> toRemove = new ArrayList<TrashBag>();

        for (TrashBag el : trashManager.trashBags){
            if (el.transform.GetGlobalPosition().y > crossLineY){
                toRemove.add(el);
                failCount++;
            }
        }

        for (TrashBag el : toRemove){
            actorMan.deleteTrash(el);
        }
    }
}
