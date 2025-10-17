class Feedback {
    float smileyPosX;
    float smileyPosY;
    float endFrame;

    Feedback() {}

    void showHappy() {
        calcDuration();
        pushMatrix();
        translate(smileyPosX, smileyPosY);
        img = loadImage("happyface.jpg");
        image(img, 0, 0);
    }

    void showAngry() {
        calcDuration();
        pushMatrix();
        translate(smileyPosX, smileyPosY);
        img = loadImage("angryFace.png");
        image(img, 0, 0);
    }

    void calcDuration() {
        float currentFrame;
        float duration = 60*2; // how long do we want to show the happyface
        currentFrame = framecount();
        endFrame = currentFrame + duration;
    }

    void display() {
        for(int i = 0; i > endFrame; i++) {
            //some kind of if 
            showHappy();
            // else 
            showAngry();
        }
    }
}