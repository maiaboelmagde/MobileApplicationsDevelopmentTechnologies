double? calculate(double num1, double num2, String operator){
  double? result;
  switch (operator){
    case '+':
      result = num1+num2;
      break;
    case '-':
      result = num1-num2;
      break;
    case '*':
      result = num1 * num2;
      break;
    case '/':
      result = num1/num2;
      break;
  }

  return result;
}
