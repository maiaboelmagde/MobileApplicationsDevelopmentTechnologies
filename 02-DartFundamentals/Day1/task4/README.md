## Task 4: Format Name Function (CLI)

**Goal**: Build a Dart function that formats a full name from CLI input using named parameters.

### ✅ Requirements
- Define the function:
  ```dart
  String formatName({required String first, String? last, String title = "Mr."})
  
* Prompt user for:

  * First name (required)
  * Last name (optional)
  * Title (optional, defaults to "Mr.")
* Validate that the first name is not empty.
* Print formatted name.
* Repeat until user enters `exit`.

### 🧠 Key Concepts

Named parameters, default values, null safety, CLI input.

----
A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.
