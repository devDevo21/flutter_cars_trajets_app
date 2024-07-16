import 'package:cars_trajets/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/theme_provider.dart';

Widget customListTile(
    Widget leading, String title, IconData icon, BuildContext context) {
  Color textColor = context.watch<CustomTheme>().textColor;
  return ListTile(
    shape: const RoundedRectangleBorder(),
    leading: leading,
    title: Text(
      title,
      style: AppTheme.textStyle(color: textColor),
    ),
    trailing: Icon(
      icon,
      color: Colors.grey,
    ),
  );
}

Widget leading(IconData icon, Color color) {
  return Container(
    padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(
        color: color, borderRadius: const BorderRadius.all(Radius.circular(7))),
    child: Icon(
      icon,
      color: Colors.white,
    ),
  );
}

class ToggleThemeMode extends StatelessWidget {
  const ToggleThemeMode({super.key});
  @override
  Widget build(BuildContext context) {
    bool theme = context.watch<CustomTheme>().theme;
    Color textColor = context.watch<CustomTheme>().textColor;
    return SwitchListTile.adaptive(
        title: Text(
          context.watch<CustomTheme>().theme ? 'Mode Sombre' : 'Mode clair',
          style: AppTheme.textStyle(color: textColor, fontSize: TextSize.md),
        ),
        value: theme,
        onChanged: (theme) {
          context.read<CustomTheme>().toggleTheme(isDark: theme);
        });
  }
}
