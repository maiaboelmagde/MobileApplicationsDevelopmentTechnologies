double? calculate(double a, double b, String operator){
  double? result;
  switch (operator){
    case '+':
      result = a+b;
      break;
    case '-':
      result = a-b;
      break;
    case '*':
      result = a * b;
      break;
    case '/':
      result = a/b;
      break;
  }

  return result;
}
