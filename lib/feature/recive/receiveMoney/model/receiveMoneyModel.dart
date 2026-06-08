class ReceiveMoneyModel {
  double amountRequested;
  String paymentLink;
  String qrCodeData;

  ReceiveMoneyModel({
    required this.amountRequested,
    required this.paymentLink,
    required this.qrCodeData,
  });
}
