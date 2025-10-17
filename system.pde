class GameSystem{
    GameplayManager gameplay;
    UIManager ui;
    GraphicsManager graphics;
    ActorManager actorMan = new ActorManager();
    InteractionManager interaction;

    public GameSystem(){
        gameplay = new GameplayManager(actorMan, settings);
        ui = new UIManager(gameplay);
        graphics = new GraphicsManager(gameplay);
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

public enum GameStage{
    WIN, LOSS, NONE
}

class GameplayManager{
    ActorManager actorMan;
    TrashAnimationManager trashManager;
    GameStage stage;
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
            spawn(settings);
        }
    }

    public void ChangeStageIfConditions(){
        if (stage != GameStage.NONE) return;

        if (failCount >= 5){
            stage = GameStage.LOSS;
        }
        else if (successCount >= 20) {
            stage = GameStage.WIN;
        }
    }

    public void spawn(Settings settings){
        actorMan.createTrash(getRandomPosition(settings.poolLeftBorderX, settings.poolRightBorderX, settings.spawnY));
    }

    public Vector2 getRandomPosition(float minX, float maxX, float y){
        return new Vector2(random(minX, maxX), y);
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
