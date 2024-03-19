class Methods {
  const Methods({
    required this.type,
    required this.cardNumber,
    required this.dateOfExpiry,
  });

  final String type;
  final String cardNumber;
  final String dateOfExpiry;
}

final List<Methods> methodsDataList = [
  const Methods(
    type: 'visa',
    cardNumber: "9876543210987654",
    dateOfExpiry: "05/2024",
  ),
  const Methods(
    type: 'mastercard',
    cardNumber: "1234567890123456",
    dateOfExpiry: "05/2024",
  ),
];