import 'dart:math' as math;

import 'package:cars_trajets/entities/theme_app.dart';
import 'package:cars_trajets/pages/details_page.dart';
import 'package:cars_trajets/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../entities/trajet.dart';
import '../provider/theme_provider.dart';

class Hearder extends StatelessWidget {
  const Hearder({super.key});

  @override
  Widget build(BuildContext context) {
    Color textColor = context.watch<CustomTheme>().textColor;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Reservez le trajet qui vous arrange",
          style: AppTheme.textStyle(
              color: textColor,
              fontSize: TextSize.xl,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.h),
        Text(
          'Choisissez parmis les trajets suivant celui qui va vers votre direction',
          style: AppTheme.textStyle(color: textColor, fontSize: TextSize.sm),
        )
      ],
    );
  }
}

class TrajetsList extends StatefulWidget {
  const TrajetsList({super.key, required this.trajet});

  final Trajet trajet;

  @override
  State<TrajetsList> createState() => _TrajetsListState();
}

class _TrajetsListState extends State<TrajetsList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => const DetailsPage(),
            arguments: widget.trajet,
            duration: const Duration(milliseconds: 500),
            transition: Transition.rightToLeft);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: Row(
          children: [
            Expanded(child: CardImage(imagePaht: widget.trajet.imageCarPath)),
            Expanded(child: TrajetSection(trajet: widget.trajet))
          ],
        ),
      ),
    );
  }
}

class CardImage extends StatefulWidget {
  const CardImage({super.key, required this.imagePaht});
  final String imagePaht;

  @override
  State<CardImage> createState() => _CardImageState();
}

class _CardImageState extends State<CardImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> animationCar;
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000))
      ..forward();
    animationCar = Tween<Offset>(
            begin: const Offset(-0.3, 0), end: const Offset(0, 0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animationCar,
      child: SizedBox(
          height: 90, width: 130, child: Image.asset(widget.imagePaht)),
    );
  }
}

class TrajetSection extends StatefulWidget {
  const TrajetSection({super.key, required this.trajet});

  final Trajet trajet;

  @override
  State<TrajetSection> createState() => _TrajetSectionState();
}

class _TrajetSectionState extends State<TrajetSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> animationTranslate;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000))
      ..forward();
    animationTranslate = Tween<Offset>(
            begin: const Offset(.3, 0), end: const Offset(0, 0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color textColor = context.watch<CustomTheme>().textColor;
    return SlideTransition(
      position: animationTranslate,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            const Icon(
              // CupertinoIcons.location_circle,
              Icons.directions_walk,
              color: Colors.green,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              widget.trajet.start,
              style: TextStyle(
                color: textColor,
              ),
            ),
          ]),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 3, bottom: 3, left: 10),
                child: Container(
                  color: AppTheme.black,
                  width: 1,
                  height: 15,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const LocationIcon(),
              const SizedBox(
                width: 5,
              ),
              Text(
                widget.trajet.end,
                style: TextStyle(
                  color: textColor,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.trajet.modelCar,
                    style: AppTheme.textStyle(
                        color: textColor, fontWeight: FontWeight.w500)),
                Text(
                  '${widget.trajet.price}XAF',
                  style: AppTheme.textStyle(
                      color: textColor, fontWeight: FontWeight.w500),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LocationIcon extends StatefulWidget {
  const LocationIcon({super.key});

  @override
  State<LocationIcon> createState() => _LocationIconState();
}

class _LocationIconState extends State<LocationIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> animationTranslate;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..repeat(reverse: true);
    animationTranslate = Tween<Offset>(
            begin: const Offset(0, -.2), end: const Offset(0, 0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animationTranslate,
      child: const Icon(
        // CupertinoIcons.map,
        Icons.fmd_good,
        color: Colors.red,
      ),
    );
  }
}
