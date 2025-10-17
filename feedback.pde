class Feedback {
    float smileyPosX;
    float smileyPosY;
    float endFrame;

    Feedback() {}

    void showHappy() {
        strokeWeight(1);
        calcDuration();
        pushMatrix();
        translate(smileyPosX, smileyPosY);
        PImage img = loadImage("happyface.jpg");
        image(img, 0, 0);
    }

    void showAngry() {
        strokeWeight(1);
        calcDuration();
        pushMatrix();
        translate(smileyPosX, smileyPosY);
        PImage img = loadImage("angryFace.png");
        image(img, 0, 0);
    }

    void calcDuration() {
        float duration = 60*5; // how long do we want to show the happyface
        endFrame = frameCount + duration;
    }

    void display(boolean state) {
        for(int i = 0; i > endFrame; i++) {
            if (state)
                showHappy();
            else {
                showAngry();
            }
        }
    }
}