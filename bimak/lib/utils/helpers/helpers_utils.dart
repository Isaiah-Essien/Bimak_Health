import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MHelperFunctions {
  // Show a snackbar with a message
  static void showSnackbar(String message) {
    final context = Get.context;
    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    } else {
      debugPrint('Context is null. Cannot show snackbar.');
    }
  }

  // Show an alert dialog with a title and message
  static void showAlert(String title, String message) {
    final context = Get.context;
    if (context != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Okay'),
              ),
            ],
          );
        },
      );
    } else {
      debugPrint('Context is null. Cannot show alert dialog.');
    }
  }

  // Navigate to another screen
  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  // Truncate text if it exceeds maxLength
  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  // Check if the current theme is dark mode
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  // Get the screen size
  static Size screenSize() {
    final context = Get.context;
    if (context != null) {
      return MediaQuery.of(context).size;
    } else {
      return Size.zero;
    }
  }

  // Get the screen height
  static double screenHeight() {
    return screenSize().height;
  }

  // Get the screen width
  static double screenWidth() {
    return screenSize().width;
  }

  // Get formatted date as a string
  static String getFormattedDate(DateTime date, {String format = 'dd MM yyyy'}) {
    return DateFormat(format).format(date);
  }

  // Remove duplicates from a list
  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  // Wrap widgets into rows of a specified size
  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
          i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }

  // Get asset path based on theme
  static String getAssetPath(BuildContext context, String lightAssetPath, String darkAssetPath) {
    return isDarkMode(context) ? darkAssetPath : lightAssetPath;
  }
}
