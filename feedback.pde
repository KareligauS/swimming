class feedback {
float smileyPosX;
float smileyPosY;
float endFrame;

    Feedback() {
    }

    showHappy(smileyPosX, smileyPosY) {
    calcDuration();
    pushMatrix();
    translate(smileyPosX, smileyPosY);
    image("happyface.png",0,0)
    }
}

    showAngry(smileyPosX, smileyPosY) {
    calcDuration();
    pushMatrix();
    translate(smileyPosX, smileyPosY);
    image("angryFace.png",0,0)
    }

calcDuration() {
    float currentFrame;
    float duration = 60*2 // how long do we want to show the happyface
    currentFrame = framecount();
    endFrame = currentFrame + duration
}

void display() {
    for(int i, i > endFrame, i++) {
    //some kind of if 
    showHappy();
    // else 
    showAngry();
    }
}