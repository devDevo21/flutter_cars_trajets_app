import 'package:cars_trajets/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/theme_provider.dart';
import '../widgets/setting_screen_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color textColor = context.watch<CustomTheme>().textColor;
    Color colorTheme = context.watch<CustomTheme>().colorTheme;
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar.medium(
          automaticallyImplyLeading: false,
          backgroundColor: colorTheme,
          title: Text(
            'Reglages',
            style: AppTheme.textStyle(
                color: textColor,
                fontSize: TextSize.lg,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
            child: Column(children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color:
                        const Color.fromARGB(255, 94, 91, 91).withOpacity(0.2)),
                child: ListTile(
                  shape: const RoundedRectangleBorder(),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      "assets/pp.png",
                    ),
                  ),
                  title: Text(
                    'Devo21',
                    style: AppTheme.textStyle(
                        color: textColor, fontSize: TextSize.lg),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color:
                        const Color.fromARGB(255, 94, 91, 91).withOpacity(0.2)),
                child: Column(children: [
                  customListTile(
                      leading(
                        CupertinoIcons.share_solid,
                        Colors.green,
                      ),
                      'Partager l\'application',
                      Icons.arrow_forward_ios,
                      context),
                  customListTile(
                      leading(
                        CupertinoIcons.info,
                        Colors.blueAccent,
                      ),
                      'Information sur l\'application',
                      Icons.arrow_forward_ios,
                      context),
                  customListTile(
                      leading(
                        CupertinoIcons.phone_fill,
                        Colors.yellowAccent,
                      ),
                      'Nous contacter',
                      Icons.arrow_forward_ios,
                      context),
                ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: const Color.fromARGB(255, 94, 91, 91).withOpacity(0.2),
                ),
                child: customListTile(
                  leading(
                    Icons.announcement,
                    Colors.purpleAccent,
                  ),
                  'Information sur l\'application',
                  Icons.arrow_forward_ios,
                  context,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const ToggleThemeMode()
            ]),
          ),
        )
      ],
    );
  }
}
