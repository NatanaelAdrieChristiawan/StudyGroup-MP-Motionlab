import 'dart:io';

class BankAccount {
  String owner;
  double balance;
  List<String> transactionHistory = [];

  BankAccount(this.owner, this.balance);

  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
      transactionHistory.add("Deposit: Rp $amount");
      print("Berhasil deposit Rp $amount");
    } else {
      print("Jumlah tidak valid.");
    }
  }

  void withDraw(double amount) {
    if (amount > 0 && amount <= balance) {
      balance -= amount;
      transactionHistory.add("Withdraw: Rp $amount");
      print("Berhasil menarik Rp $amount");
    } else {
      print("Saldo tidak mencukupi atau jumlah tidak valid.");
    }
  }

  void showBalance() {
    print("Saldo anda saat ini : Rp $balance");
  }

  void showTransactionHistory() {
    if (transactionHistory.isEmpty) {
      print("Belum ada transaksi.");
    } else {
      print("Riwayat Transaksi: ");
      for (var transaction in transactionHistory) {
        print("- $transaction");
      }
    }
  }
}

void main() {
  BankAccount account = BankAccount("Pengguna", 0);

  while (true) {
    print("\n=========================");
    print("APLIKASI KING BANK");
    print("=========================");
    print("1. Cek Saldo");
    print("2. Deposit Saldo");
    print("3. Tarik Saldo");
    print("4. Riwayat Transaksi");
    print("5. Keluar");
    stdout.write("Pilih menu (1-5): ");
    String? input = stdin.readLineSync();

    switch (input) {
      case '1':
        account.showBalance();
        break;
      case '2':
        stdout.write("Masukkan jumlah deposit: Rp");
        double? amount = double.tryParse(stdin.readLineSync() ?? "");
        if (amount != null) {
          account.deposit(amount);
        } else {
          print("Input tidak valid.");
        }
        break;
      case '3':
        stdout.write("Masukkan jumlah tarik tunai: Rp ");
        double? amount = double.tryParse(stdin.readLineSync() ?? "");
        if (amount != null) {
          account.withDraw(amount);
        } else {
          print("Input tidak valid.");
        }
        break;
      case '4':
        account.showTransactionHistory();
        break;
      case '5':
        print("Terima kasih telah menggunakan aplikasi ini.");
        exit(0);
      default:
        print("Pilihan tidak valid. Silahkan coba lagi.");
    }
  }
}
