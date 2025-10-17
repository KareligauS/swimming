// --- Minimal placeholder for the Circle class ---
class UIManager {
    GameplayManager gameplay;

    UIManager(GameplayManager _gameplay) {
        gameplay = _gameplay;
    }

    //update display
    void display() {
        String pointsMsg = "Current Points: " + gameplay.successCount;
        fill(200); 
        text(pointsMsg, 40, 40);
    }

    void finalMsg() {
        String msg = "You don't want animals to pollute your home. Don't pollute theirs!";
        fill(200);
        text(msg, width/2, 700);
    }
}