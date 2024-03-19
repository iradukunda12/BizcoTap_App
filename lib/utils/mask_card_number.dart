String maskCardNumber(String cardNumber) {
  if (cardNumber.length < 16) {
    // Invalid card number, return as is
    return cardNumber;
  }

  // Extracting the first and last four digits
  String firstFour = cardNumber.substring(0, 4);
  String lastFour = cardNumber.substring(cardNumber.length - 4);

  // Masking the middle digits with dots
  String maskedMiddle = '•' * (cardNumber.length - 8);

  // Combining the masked string
  return '$firstFour$maskedMiddle$lastFour';
}