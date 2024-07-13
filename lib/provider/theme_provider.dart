import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final themeProvider = ChangeNotifierProvider(create: (ref) => CustomTheme());

class CustomTheme extends ChangeNotifier {
  bool theme = true;

  Color get colorTheme {
    return theme ? Colors.black : const Color(0xffffffff);
  }

  Color get textColor {
    return theme ? const Color(0xffffffff) : Colors.black;
  }

  Color get thirdColor {
    return theme ? const Color(0xff0e76bd) : const Color(0xff0e76bd);
  }

  void toggleTheme({required bool isDark}) {
    theme = isDark;
    notifyListeners();
  }
}
