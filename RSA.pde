// Need G4P library
import g4p_controls.*;
import java.math.*;
import java.math.BigInteger;
import java.util.*;
Random rnd = new Random();
BigInteger q;
BigInteger p;
BigInteger n;
BigInteger one = new BigInteger("1");
BigInteger totn;
BigInteger e;
BigInteger d;
int res;

public void setup() {
  size(300, 300, JAVA2D);
  createGUI();
  customGUI();
  // Place your setup code here
}

public void draw() {
  background(230);
}



// Use this method to add additional statements
// to customise the GUI controls
public void customGUI() {
}
