// --- Minimal placeholder for the Circle class ---
class UIManager {
    GameplayManager gameplay;

    UIManager(GameplayManager _gameplay) {
        gameplay = _gameplay;
    }

    //update display
    void display() {
        displaySuccessPoints();
        displayStageMsg();
    }

    void displaySuccessPoints(){
        String pointsMsg = "Current Points: " + gameplay.successCount;
        fill(0); 
        textSize(32);
        text(pointsMsg, 40, 40);
    }

    void displayStageMsg(){
        if (gameplay.stage == GameStage.LOSS){
            //LOSS
        }
        else if (gameplay.stage == GameStage.WIN){
            //WIN
        }
    }
}