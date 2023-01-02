import 'dart:math';

import 'controllers/bank_controller.dart';
import 'exceptions/bank_controller_exceptions.dart';
import 'models/account.dart';

void testingNullSafety() {
  Account? myAccount =
      Account(name: "Bruna", balance: 200, isAuthenticated: true);

  Random rng = Random();
  int randomNumber = rng.nextInt(10);
  print(randomNumber);

  if (randomNumber <= 5) {
    myAccount.createdAt = DateTime.now();
  }

  print(myAccount.runtimeType);

  // if (myAccount != null) {
  //   print(myAccount.balance);
  // } else {
  //   print("Conta nula");
  // }

  // print(myAccount != null ? myAccount.balance : "Conta nula.");

  print(myAccount?.balance);
}

void main() {
  testingNullSafety();

  // Criando o banco
  BankController bankController = BankController();

  // Adicionando contas
  bankController.addAccount(
      id: "Ricarth",
      account:
          Account(name: "Ricarth Lima", balance: 400, isAuthenticated: true));

  bankController.addAccount(
      id: "Kako",
      account:
          Account(name: "Caio Couto", balance: 600, isAuthenticated: true));

  // Fazendo transferência
  try {
    bool result = bankController.makeTransfer(
        idSender: "Kako", idReceiver: "Ricarth", amount: 100);

    if (result) {
      // print("Transação concluída com sucesso!");
    }
  } on SenderIdInvalidException catch (e) {
    print(e);
    print("O ID '${e.idSender}' do remetente não é um ID válido.");
  } on ReceiverIdInvalidException catch (e) {
    print(e);
    print("O ID '${e.idReceiver}' do destinatário não é um ID válido.");
  } on SenderNotAuthException catch (e) {
    print(e);
    print("O usuário remetente de ID '${e.idSender}' não está autenticado.");
  } on SenderBalanceLowerException catch (e) {
    print(e);
    print(
        "O usuário de ID '${e.idSender}' tentou enviar ${e.amount} sendo que na sua conta tem apenas ${e.senderBalance}");
  } on Exception {
    print("Algo deu errado.");
  }
}
