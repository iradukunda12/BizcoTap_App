class CreditCardModel {
  CreditCardModel(
      this.cardNumber, this.expiryDate, this.cvvCode, this.isCvvFocused);

  // Number of the credit/debit card.
  String cardNumber = '';

  // Expiry date of the card.
  String expiryDate = '';

  // Cvv code on card.
  String cvvCode = '';

  // A boolean for indicating if cvv is focused or not.
  bool isCvvFocused = false;
}
