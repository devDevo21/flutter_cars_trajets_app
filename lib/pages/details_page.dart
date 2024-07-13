import 'package:cars_trajets/pages/home_page.dart';
import 'package:cars_trajets/provider/cars_provider.dart';
import 'package:cars_trajets/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../entities/trajet.dart';
import '../provider/theme_provider.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {
  final Trajet trajet = Get.arguments as Trajet;
  late final AnimationController _controller;
  late final Animation<Offset> animate;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this)
      ..forward();
    animate = Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0))
        .animate(
            CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color textColor = context.watch<CustomTheme>().textColor;
    Color colorTheme = context.watch<CustomTheme>().colorTheme;
    Color thirdColor = context.watch<CustomTheme>().thirdColor;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colorTheme,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: textColor,
            )),
        title: Text(
          'Details',
          style: AppTheme.textStyle(color: textColor),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.close,
                color: textColor,
              ))
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Image.asset('assets/map.jpeg'),
                  Positioned(
                      bottom: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 365,
                        color: Colors.transparent,
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 0,
                              child: Container(
                                margin: const EdgeInsets.only(top: 70),
                                padding: const EdgeInsets.only(
                                    top: 60, left: 10, right: 10, bottom: 15),
                                // height: 200,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  color: colorTheme,
                                ),
                                child: Column(
                                  children: [
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Minicard(
                                            content: 'Confort',
                                            iconData: Icons.directions_car),
                                        Minicard(
                                            content: '5',
                                            iconData: Icons.group),
                                        Minicard(
                                            content: 'Auto',
                                            iconData: Icons.av_timer)
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          trajet.modelCar,
                                          style: AppTheme.textStyle(
                                              color: textColor,
                                              fontSize: TextSize.lg),
                                        ),
                                        Text(
                                          trajet.end,
                                          style: AppTheme.textStyle(
                                              color: textColor),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${trajet.price} XOF',
                                          style: AppTheme.textStyle(
                                              color: textColor),
                                        ),
                                        Text(
                                          '${trajet.time} heures',
                                          style: AppTheme.textStyle(
                                              color: textColor),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    SizedBox(
                                      height: 50,
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: thirdColor,
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(7)))),
                                        onPressed: () async {
                                          await showModalBottomSheet(
                                              useRootNavigator: true,
                                              backgroundColor: colorTheme,
                                              useSafeArea: true,
                                              isDismissible: false,
                                              enableDrag: false,
                                              showDragHandle: true,
                                              context: context,
                                              builder: (context) {
                                                return Container(
                                                  height: 203,
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                          'Voulez vous reserver ?',
                                                          style: AppTheme
                                                              .textStyle(
                                                                  color:
                                                                      textColor,
                                                                  fontSize:
                                                                      TextSize
                                                                          .md)),
                                                      const SizedBox(
                                                        height: 25,
                                                      ),
                                                      ModalBottomSheetButton(
                                                        text: 'Confirmer',
                                                        buttonType:
                                                            ButtonType.confirm,
                                                        trajet: trajet,
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      ModalBottomSheetButton(
                                                        text: 'Annuler',
                                                        buttonType:
                                                            ButtonType.cancel,
                                                        trajet: trajet,
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              });
                                        },
                                        child: Text(
                                          'Reserver',
                                          style: AppTheme.textStyle(
                                              fontSize: TextSize.md,
                                              color: textColor),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                                top: 0,
                                left: 35.w,
                                child: SlideTransition(
                                  position: animate,
                                  child: SizedBox(
                                      width: 350,
                                      child: Image.asset(trajet.imageCarPath)),
                                )),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Minicard extends StatelessWidget {
  const Minicard({super.key, required this.content, this.iconData});
  final String content;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    Color textColor = context.watch<CustomTheme>().textColor;
    Color thirdColor = context.watch<CustomTheme>().thirdColor;
    return Container(
      decoration: BoxDecoration(
          color: thirdColor,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 7),
        child: Row(
          children: [
            Visibility(
              visible: iconData != null,
              child: Icon(
                iconData,
                color: textColor,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              content,
              style: AppTheme.textStyle(
                  color: textColor, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}

class ModalBottomSheetButton extends StatelessWidget {
  const ModalBottomSheetButton(
      {super.key,
      required this.text,
      required this.buttonType,
      required this.trajet});
  final String text;
  final ButtonType buttonType;
  final Trajet trajet;

  @override
  Widget build(BuildContext context) {
    Color textColor = context.watch<CustomTheme>().textColor;
    Color thirdColor = context.watch<CustomTheme>().thirdColor;
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            backgroundColor: ButtonType.confirm == buttonType ? thirdColor : const Color.fromARGB(255, 49, 46, 46),
          ),
          onPressed: () {
            if (ButtonType.confirm == buttonType) {
              confirmReservation(
                  execute: context.read<Car>().confirmReservation,
                  trajet: trajet);
            } else if (ButtonType.cancel == buttonType) {
              Get.back();
            }
          },
          child: Text(
            text,
            style: AppTheme.textStyle(color: textColor, fontSize: TextSize.md),
          )),
    );
  }
}

void confirmReservation({required Function execute, required Trajet trajet}) {
  execute(trajet);
  Get.to(() => const HomePage(),
      transition: Transition.leftToRight,
      duration: const Duration(milliseconds: 500));
  Get.snackbar('Reservation Ajouté', 'Votre reservation a bien été ajouté',
      // colorText: textColor,
      // showProgressIndicator : true,
      overlayBlur: 15,
      backgroundColor: Colors.grey,
      icon: const Icon(CupertinoIcons.alarm));
}

enum ButtonType { confirm, cancel }
