import 'package:bizcotap/utils/app_exports.dart';

class PaymentCard {
  PaymentCard({
    this.type,
    this.number,
    this.name,
    this.month,
    this.year,
    this.cvv,
  });

  CardType? type;
  String? number;
  String? name;
  int? month;
  int? year;
  int? cvv;
}

class CardUtils {
  // Validates the CVV (Card Verification Value)
  static String? validateCVV(String? value) {
    if (value == null || value.isEmpty) {
      return 'CVV is required';
    }
    if (value.length < 3 || value.length > 4) {
      return 'CVV is invalid';
    }
    return null;
  }

  // Validates the card expiration date
  static String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Expiration date is required';
    }
    int year;
    int month;

    if (value.contains(RegExp(r'(/)'))) {
      var split = value.split(RegExp(r'(/)'));
      month = int.parse(split[0]);
      year = int.parse(split[1]);
    } else {
      month = int.parse(value.substring(0, value.length));
      year = -1;
    }

    if (month < 1 || month > 12) {
      return 'Expiry month is invalid';
    }

    var fourDigitsYear = convertYearTo4Digits(year);

    if (fourDigitsYear < 1 || fourDigitsYear > 2099) {
      return 'Expiry year is invalid';
    }

    if (!hasDateExpired(month, year)) {
      return 'Card has expired';
    }
    return null;
  }

  // Convert a two-digit year to a four-digit year if necessary
  static int convertYearTo4Digits(int year) {
    if (year < 100 && year >= 0) {
      var now = DateTime.now();
      String currentYear = now.year.toString();
      String prefix = currentYear.substring(0, currentYear.length - 2);
      year = int.parse('$prefix${year.toString().padLeft(2, '0')}');
    }
    return year;
  }

  // Check if the card has expired
  static bool hasDateExpired(int month, int year) {
    return isNotExpired(year, month);
  }

  // Check if the card has not expired
  static bool isNotExpired(int year, int month) {
    return !hasYearPassed(year) && !hasMonthPassed(year, month);
  }

  // Extract the month and year from the input string
  static List<int> getExpiryDate(String value) {
    var split = value.split(RegExp(r'(/)'));
    return [int.parse(split[0]), int.parse(split[1])];
  }

  // Check if the card's month has passed
  static bool hasMonthPassed(int year, int month) {
    var now = DateTime.now();

    return hasYearPassed(year) ||
        convertYearTo4Digits(year) == now.year && (month < now.month + 1);
  }

  // Check if the card's year has passed
  static bool hasYearPassed(int year) {
    int fourDigitsYear = convertYearTo4Digits(year);
    var now = DateTime.now();

    return fourDigitsYear < now.year;
  }

  // Remove non-numeric characters from the card number
  static String getCleanedNumber(String text) {
    RegExp regExp = RegExp(r"[^0-9]");
    return text.replaceAll(regExp, '');
  }

  // Get a card image widget based on the card type
  static Widget? getCardImage(CardType? cardType) {
    String img = "";
    Icon? icon;

    switch (cardType) {
      case CardType.master:
        img = 'mastercard.png';
        break;
      case CardType.visa:
        img = 'visa.png';
        break;
      case CardType.americanExpress:
        img = 'american_express.png';
        break;
      case CardType.unknown:
        icon = const Icon(
          Icons.credit_card,
          size: 15,
          color: AppColors.lighterDark,
        );
        break;
      default:
        icon = const Icon(
          Icons.warning,
          size: 15,
          color: AppColors.danger,
        );
        break;
    }

    Widget? widget;
    if (img.isNotEmpty) {
      widget = MyImage(
        imagePath: 'assets/payment/$img',
        width: 30,
        height: 15,
        fit: BoxFit.contain,
      );
    } else {
      widget = icon;
    }
    return widget;
  }

  // Validate the card number using the Luhn Algorithm
  static String? validateCardNum(String? input) {
    if (input == null || input.isEmpty) {
      return 'Card number is required';
    }

    input = getCleanedNumber(input);
    if (input.length != 16) {
      return 'Card number must have exactly 16 digits';
    }

    int sum = 0;
    int length = input.length;

    for (var i = 0; i < length; i++) {
      int digit = int.parse(input[length - i - 1]);

      if (i % 2 == 1) {
        digit *= 2;
        if (digit > 9) {
          digit -= 9;
        }
      }

      sum += digit;
    }

    if (sum % 10 == 0) {
      return null;
    }

    return 'Card number is invalid';
  }

  // Validates the cardholder name
  static String? validateCardHolderName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Cardholder name is required';
    }
    // You can add more specific validation logic for cardholder names if needed.
    return null;
  }

  // Get the card type from the card number
  static CardType getCardTypeFromNumber(String input) {
    if (RegExp(r'^[5][1-5]|^2[2][2-7][0-9]|^2[3-6][0-9]{2}|^27[01][0-9]|^2720')
        .hasMatch(input)) {
      return CardType.master;
    } else if (RegExp(r'^4').hasMatch(input)) {
      return CardType.visa;
    } else if (RegExp(r'^((34)|(37))').hasMatch(input)) {
      return CardType.americanExpress;
    }
    return CardType.unknown;
  }
}
