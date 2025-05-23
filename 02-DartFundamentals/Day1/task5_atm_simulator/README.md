## Task 5: ATM Simulator

Simulate a basic ATM interface in the CLI where users can log in with a PIN and perform operations like checking balance, depositing, and withdrawing money.

---

### ✅ Requirements

- Ask for a 4-digit PIN (`1234` is correct).
- Exit with a message if the PIN is incorrect.
- Show a repeating menu:
  1. Check Balance  
  2. Deposit  
  3. Withdraw  
  4. Exit  
- Start with a balance of `1000`.
- For deposit: prompt for an amount and add to the balance.
- For withdrawal: prompt for an amount, subtract if sufficient, otherwise show an error.
- Use a `while (true)` loop with a `switch` or `if` statement.
- Handle invalid/non-numeric inputs.

---

### 🧠 Learning Outcomes

- Practice `while`, `switch`/`if` statements, and Dart CLI input.
- Simulate real-world logic in a Dart program.
- Work with `double` values and input validation.

----
A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.
