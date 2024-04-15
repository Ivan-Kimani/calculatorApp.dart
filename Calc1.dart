import 'dart:io';

void main() {
  bool continueCalculation = true;

  while (continueCalculation) {
    print('Simple Calculator');
    print('1. Addition');
    print('2. Subtraction');
    print('3. Multiplication');
    print('4. Division');
    print('5. Exit');
    stdout.write('Choose an option: ');

    String? input = stdin.readLineSync();
    if (input == null) {
      print('Invalid input. Please try again.');
      continue;
    }

    switch (input) {
      case '1':
        performOperation('Addition', '+');
        break;
      case '2':
        performOperation('Subtraction', '-');
        break;
      case '3':
        performOperation('Multiplication', '*');
        break;
      case '4':
        performOperation('Division', '/');
        break;
      case '5':
        continueCalculation = false;
        print('Exiting calculator.');
        break;
      default:
        print('Invalid option. Please choose a number between 1 to 5.');
    }
  }
}

void performOperation(String operationName, String operator) {
  stdout.write('Enter first number: ');
  double? firstNumber = double.tryParse(stdin.readLineSync() ?? '');
  if (firstNumber == null) {
    print('Invalid input for the first number.');
    return;
  }

  stdout.write('Enter second number: ');
  double? secondNumber = double.tryParse(stdin.readLineSync() ?? '');
  if (secondNumber == null) {
    print('Invalid input for the second number.');
    return;
  }

  double result;
  switch (operator) {
    case '+':
      result = firstNumber + secondNumber;
      break;
    case '-':
      result = firstNumber - secondNumber;
      break;
    case '*':
      result = firstNumber * secondNumber;
      break;
    case '/':
      if (secondNumber == 0) {
        print('Cannot divide by zero.');
        return;
      }
      result = firstNumber / secondNumber;
      break;
    default:
      print('Invalid operator.');
      return;
  }

  print('$operationName Result: $result');
}
