BigInteger coPrime(int bits, Random rnd) {
  BigInteger prime2;
  do {
    prime2 = BigInteger.probablePrime(bits, rnd);
    res = totn.compareTo(prime2);
  } while (!isPrime (prime2) || res == -1 || res == 0);
  return prime2;
}

BigInteger definitePrime(int bits, Random rnd) {
  BigInteger prime;
  do {
    prime = BigInteger.probablePrime(bits, rnd);
  } while (!isPrime (prime));
  return prime;
}

public static Boolean isPrime(BigInteger num) {
  if (num.intValue()==2) {
    return(true);
  }
  for (int i=2; i<= (int)Math.sqrt(num.intValue())+1; i++) {
    if (num.intValue()%i==0) {
      return(false);
    }
  }
  return(true);
}
