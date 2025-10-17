int n = 25; //integer to be converted to binary

String toBinary(int n){
    String sequence = "";

    while(n > 0){
        if (n % 2 == 0){
            n = n / 2;
            sequence = "0" + sequence;
        }
        else {
            n = (n - 1) / 2;
            sequence = "1" + sequence;
        }
    }

    return sequence;
}

//Program starting point: Print binary of n.
void setup(){
    println(toBinary(n));
}
