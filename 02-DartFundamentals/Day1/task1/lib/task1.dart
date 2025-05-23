int calcFactorial(int num) {
  if(num == 0)
    return 1;

  return num * calcFactorial(num-1); 
}
