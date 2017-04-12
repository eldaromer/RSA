public static BigInteger compress(String iText)
{
  boolean readable=false;
  String bText=""; //Creates a string to hold the value of the binary of the compressed numbers
  for (int i = 0; i<iText.length (); i++) //Repeats iterations for the length of the input text
  {
    char charText = iText.charAt(i);//Creates a separate character for the each letter of the string, creating a new one for each iteration
    int bInt= char(charText)-96; //Converts this character into an ASCII (American Standard Code for Information Interchange) value, then subtracts 96 to get the alphanumeric value of the letter
    String bString = ""+bInt;
    bString=bString.replaceAll("-64", "0");
    bInt=Integer.parseInt(bString);
    if (96 <= (bInt+96) && (bInt+96) <= 122) {
      readable=true;
    } else {
      readable=false;
      break;
    }
    String bLet=binary(bInt).substring(27, 32);//Converts this number into binary, and then cuts it down to be 5 digits (bits)
    bText += bLet; //Adds this binary value to the string after each iteration
  }
  if (readable==true)
  {
    BigInteger rText=new BigInteger("0"); //Creates a new blank BigInteger to house the new compressed value
    rText=bitToNum(bText); //Pushes the converted value of the binary text into the BigInteger
    return rText; //Returns the string
  } else {
    BigInteger rText=new BigInteger("-10"); //Creates a new blank BigInteger to house the new compressed value
    return rText; //Returns the string
  }
}


/****___________________________________________________________________________________________________________________________________________________________________________________________________________****/


String decompress(BigInteger iText)
{
  String numString = ""; //Creates a blank string to eventually be filled and returned
  boolean readable=false;
  String fText=iText.toString(10);
  {
    for (int i = 0; i<fText.length(); i++) //Repeats iterations for the length of the input text
    {
      char charText = fText.charAt(i);//Creates a separate character for the each letter of the string, creating a new one for each iteration
      int bInt= char(charText)-96; //Converts this character into an ASCII (American Standard Code for Information Interchange) value, then subtracts 96 to get the alphanumeric value of the letter
      if (48 <= (bInt+96) && (bInt+96) <= 57) {
        readable=true;
      } else {
        readable=false;
        break;
      }
    }
    if (readable == true)
    {
      String bText=iText.toString(2); //Converts the input number to a binary string. The "2" in toString is what makes it binary (base 2)

      while (bText.length ()%5!=0) //While the length of the binary string is not divisible by 5...
      {
        bText="0"+bText; //Adds a "0" at the beginning of the string, increasing the length of the string without changing it's value.
      }

      for (int g=0; g< (bText.length()/5); g++) //Repeats iterations for as long as the length of the binary divided by 5
      {
        BigInteger tempString= new BigInteger("0"); //Creates a temporary bigInteger to be used in the function
        tempString=(bitToNum(bText.substring(5*g, 5*g+5))); //Breaks the string into a group of 5 "1"s and "0"s, a new group for each iteration
        int newNum=tempString.intValue(); //Converts this 5 bit binary string back into its alphanumeric value
        int asciiVal = newNum + 96; //Adds 96 to the alphanumeric value so it can be interpreted correctly as an ASCII value
        char tempChar = char(asciiVal); //Converts this ASCII number into the corresponding correct character
        numString += str(tempChar); //Adds this character to the string
        numString = numString.replaceAll("`", " "); //Changes all Grave Accents (https://en.wikipedia.org/wiki/Grave_accent) to a space, as the ascii value of the accent is 96
      }
    } else {
      numString += "Character(s) Unusuable";
    }
  }
  return numString;//Returns the string
}


/****___________________________________________________________________________________________________________________________________________________________________________________________________________****/


public static BigInteger bitToNum(String bitNumber)
{
  BigInteger returnNum = new BigInteger("0"); //Creates a variable to return after the function
  BigInteger two = new BigInteger("2");
  for (int i=1; i<= bitNumber.length (); i++) //Repeats iterations for as long as the length of the binary equivalent of the text
  {
    if (bitNumber.charAt(bitNumber.length()-i) == '1') 
    {
      returnNum =returnNum.add(two.pow((i-1)));
    }
    /*If the value of the character is "1", then increase the value of the newNumber by 
     2 to the power of that numbers placement in the binary. i.e. 00011 increases newNumber
     by 2^0 and then by 2^1, or 1+2, or 5.*/
  }
  return returnNum; //Returns the final added number
}
