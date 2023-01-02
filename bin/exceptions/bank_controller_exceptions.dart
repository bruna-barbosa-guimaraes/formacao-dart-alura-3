class SenderIdInvalidException implements Exception {
  static const String report = "SenderIdInvalidException";

  String idSender;
  SenderIdInvalidException({required this.idSender});

  @override
  String toString() {
    return "$report \nID Sender: $idSender";
  }
}

class ReceiverIdInvalidException implements Exception {
  static const String report = "ReceiverIdInvalidException";

  String idReceiver;
  ReceiverIdInvalidException({required this.idReceiver});

  @override
  String toString() {
    return "$report \nID Receiver: $idReceiver";
  }
}

class SenderNotAuthException implements Exception {
  static const String report = "SenderNotAuthException";

  String idSender;
  SenderNotAuthException({required this.idSender});

  @override
  String toString() {
    return "$report \nID Receiver: $idSender";
  }
}

class SenderBalanceLowerException implements Exception {
  static const String report = "SenderBalanceLowerException";

  String idSender;
  double senderBalance;
  double amount;

  SenderBalanceLowerException(
      {required this.idSender,
      required this.senderBalance,
      required this.amount});

  @override
  String toString() {
    return "$report \nID Sender: $idSender \nSender Balance: $senderBalance \nAmount: $amount";
  }
}
