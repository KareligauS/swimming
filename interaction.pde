class InteractionManager{
    GameplayManager gameplay;

    public InteractionManager(GameplayManager _gameplay){
        gameplay = _gameplay;
    }

    public void onClick(Vector2 clickPos){
        gameplay.onClick(clickPos);
    }
}
