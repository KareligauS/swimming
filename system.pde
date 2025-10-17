class GameSystem{
    GameplayManager gameplay;
    UIManager ui;
    GraphicsManager graphics = new GraphicsManager();
    ActorManager actorMan = new ActorManager();
    InteractionManager interaction;

    public GameSystem(){
        gameplay = new GameplayManager(actorMan, settings);
        ui = new UIManager(gameplay);
        interaction = new InteractionManager(gameplay);
        graphics.connect(actorMan.displays);        
    }

    public void display(){
        graphics.displayAll();
        ui.display();
    }

    public void update(Settings settings){
        gameplay.update(settings);
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

    public GameplayManager(ActorManager _actorMan, Settings _settings){
        actorMan = _actorMan;
        settings = _settings;
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

    public void update(Settings settings){
        trashManager.update(settings);
        processTrashBags(settings);

        if (frameCount % settings.spawnCountFrame == 0){
            spawn();
        }
    }

    public void spawn(){
        actorMan.createTrash(new Vector2(50, 50));
    }

    public void processTrashBags(Settings settings){
        ArrayList<TrashBag> toRemove = new ArrayList<TrashBag>();

        for (TrashBag el : trashManager.trashBags){
            if (el.transform.GetGlobalPosition().y > settings.crossLineY){
                toRemove.add(el);
                failCount++;
            }
        }

        for (TrashBag el : toRemove){
            actorMan.deleteTrash(el);
        }
    }
}
