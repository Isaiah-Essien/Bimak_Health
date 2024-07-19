import 'package:intl/intl.dart';

class MFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MM-yyyy').format(date);
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_NG', symbol: '₦').format(amount);
  }

  static String formatPhoneNumber(String phoneNumber) {
    // Assuming Nigerian phone number in the format +2348155018523
    if (phoneNumber.length == 13 && phoneNumber.startsWith('+234')) {
      return '+234 (${phoneNumber.substring(4, 7)}) ${phoneNumber.substring(7, 10)}-${phoneNumber.substring(10, 13)}';
    } else if (phoneNumber.length == 11 && phoneNumber.startsWith('0')) {
      // Assuming Nigerian phone number in the format 08155018523
      return '(${phoneNumber.substring(1, 4)}) ${phoneNumber.substring(4, 7)}-${phoneNumber.substring(7, 11)}';
    }
    return phoneNumber;
  }
}
