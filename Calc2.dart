//calculator.dart

import 'dart:io';

void main() {
  print("Welcome to the Simple Calculator!");

  // Get user input for first number  double?- used to prevent errors caused by accessing variables that dont have a vlue assigned yet.i.e is user enters something invalid(empt string..)
  double? firstNumber = getNumberInput("Enter the first number: ");

  // Get user input for second number
  double? secondNumber = getNumberInput("Enter the second number: ");

  // Check if both numbers are valid
  if (firstNumber != null && secondNumber != null) {
    // Choose operation from user
    String operation = chooseOperation();

    // Perform calculation based on chosen operation
    double result = calculate(operation, firstNumber, secondNumber);

    // Print the result
    print("The result is: $result");
  } else {
    print("Invalid input. Please enter valid numbers.");
  }
}

// Function to get a double number input from the user
double? getNumberInput(String prompt) {
  print(prompt);
  String? input = stdin.readLineSync();

  if (input != null) {
    try {
      return double.parse(input);
    } on FormatException {
      print("Invalid input. Please enter a number.");
      return null;
    }
  }
  return null;
}

// Function to display available operations and get user choice
String chooseOperation() {
  print("Choose an operation:");
  print("1. Addition (+)");
  print("2. Subtraction (-)");
  print("3. Multiplication (*)");
  print("4. Division (/)");

  String? choice = stdin.readLineSync();

  if (choice != null) {
    switch (choice) {
      case "1":
        return "+";
      case "2":
        return "-";
      case "3":
        return "*";
      case "4":
        return "/";
      default:
        print("Invalid choice. Please choose a valid operation (1-4).");
        return chooseOperation(); // Recursively call if choice is invalid
    }
  } else {
    print("Invalid input. Please enter a choice.");
    return chooseOperation(); // Recursively call if input is invalid
  }
}

// Function to perform calculation based on operation
double calculate(String operation, double num1, double num2) {
  switch (operation) {
    case "+":
      return num1 + num2;
    case "-":
      return num1 - num2;
    case "*":
      return num1 * num2;
    case "/":
      if (num2 == 0) {
        print("Error: Division by zero is not allowed.");
        return 0.0; // Return a default value for division by zero
      }
      return num1 / num2;
    default:
      throw Exception("Invalid operation"); // Handle unexpected operation
  }
}
