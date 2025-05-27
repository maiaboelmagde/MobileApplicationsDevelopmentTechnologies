class BankAccount{
  double _balance;

  BankAccount(this._balance);

  get getBalance =>"Balance: ${_balance.toString()}";

  deposit(double amount){
    this._balance += amount;
  }

  withdraw(double amount){
    if(this._balance < amount){
      throw InsufficientFundsError();
    }
    this._balance -= amount;
  }
}

class InsufficientFundsError extends Error{
  
}
