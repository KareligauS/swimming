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
            winOrLoose(false);
        }
        else if (gameplay.stage == GameStage.WIN){
            winOrLoose(true);
        }
    }
        
    void finalMsg() {
        String msg = "You don't want animals to pollute your home. Don't pollute theirs!";
        fill(200);
        text(msg, 0, 700);
    }

//output text for win or loose
    void winOrLoose(boolean isWin) {
        finalMsg();
        if(isWin) { //input win condition
            String win = "Congratulations You've won!";
            text(win,0,680);
        } else { //input loose condition
            String loose = "Huh, seems like You've lost...";
            text(loose,0,680);
        }
    }
}