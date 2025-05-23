## Task 3: Simple Calculator (CLI)

**Goal**: Create a CLI calculator that performs basic arithmetic on two numbers.

### ✅ Requirements
- Create a function:
  ```dart
  double? calculate(double a, double b, String operator)


* Read two numbers and an operator (`+`, `-`, `*`, `/`) from the CLI.
* Validate inputs:

  * Reject non-numeric inputs.
  * Reject invalid operators.
  * Handle division by zero.
* Print the result or a clear error message.
* Allow repeated calculations until user exits.

### 🧠 Key Concepts

Functions, conditionals, loops, error handling, and CLI input.

-------------------
A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.
