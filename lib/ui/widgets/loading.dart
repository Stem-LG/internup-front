import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:get/get.dart';

class RoundedRectangle extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final bool vertical;
  const RoundedRectangle.vertical({
    Key? key,
    required this.width,
    required this.height,
    required this.color,
  })  : vertical = true,
        super(key: key);

  const RoundedRectangle.horizontal({
    Key? key,
    required this.width,
    required this.height,
    required this.color,
  })  : vertical = false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          vertical ? width : height,
        ),
      ),
    );
  }
}

class BuildSides extends StatelessWidget {
  final double maxLength;
  final double depth;
  final Color color;
  final AnimationController controller;
  final Interval interval;
  final double rotationAngle;
  final Offset rotationOrigin;
  final bool forward;
  const BuildSides.forward({
    Key? key,
    required this.maxLength,
    required this.depth,
    required this.color,
    required this.controller,
    required this.interval,
    this.rotationAngle = 0,
    this.rotationOrigin = Offset.zero,
  })  : forward = true,
        super(key: key);

  const BuildSides.reverse({
    Key? key,
    required this.maxLength,
    required this.depth,
    required this.color,
    required this.controller,
    required this.interval,
    this.rotationAngle = 0,
    this.rotationOrigin = Offset.zero,
  })  : forward = false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final double offset = maxLength / 2;
    final double startInterval = interval.begin;
    final double middleInterval = (interval.begin + interval.end) / 2;

    final double endInterval = interval.end;

    final CurvedAnimation leftCurvedAnimation = CurvedAnimation(
      parent: controller,
      curve: Interval(
        startInterval,
        middleInterval,
      ),
    );

    final CurvedAnimation rightCurvedAnimation = CurvedAnimation(
      parent: controller,
      curve: Interval(
        middleInterval,
        endInterval,
      ),
    );

    final Widget firstChild = Visibility(
      visible: forward ? controller.value <= middleInterval : controller.value >= middleInterval,
      child: Transform.translate(
        offset: Tween<Offset>(
          begin: forward ? Offset.zero : Offset(offset, 0),
          end: forward ? Offset(offset, 0) : Offset.zero,
        )
            .animate(
              forward ? leftCurvedAnimation : rightCurvedAnimation,
            )
            .value,
        child: RoundedRectangle.horizontal(
          width: Tween<double>(begin: forward ? depth : maxLength, end: forward ? maxLength : depth)
              .animate(
                forward ? leftCurvedAnimation : rightCurvedAnimation,
              )
              .value,
          height: depth,
          color: color,
        ),
      ),
    );

    final Widget secondChild = Visibility(
      visible: forward ? controller.value >= middleInterval : controller.value <= middleInterval,
      child: Transform.translate(
        offset: Tween<Offset>(
          begin: forward ? Offset(-offset, 0) : Offset.zero,
          end: forward ? Offset.zero : Offset(-offset, 0),
        )
            .animate(
              forward ? rightCurvedAnimation : leftCurvedAnimation,
            )
            .value,
        child: RoundedRectangle.horizontal(
          width: Tween<double>(begin: forward ? maxLength : depth, end: forward ? depth : maxLength)
              .animate(
                forward ? rightCurvedAnimation : leftCurvedAnimation,
              )
              .value,
          height: depth,
          color: color,
        ),
      ),
    );

    final List<Widget> children = <Widget>[firstChild, secondChild];

    return Transform.rotate(
      angle: rotationAngle,
      origin: rotationOrigin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children,
      ),
    );
  }
}

class DotsTriangle extends StatefulWidget {
  final double size;
  final Color color;
  const DotsTriangle({
    Key? key,
    required this.color,
    required this.size,
  }) : super(key: key);

  @override
  createState() => _DotsTriangleState();
}

class _DotsTriangleState extends State<DotsTriangle> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final Color color = widget.color;
    final double size = widget.size;
    final double dotDepth = size / 12;
    final double dotLength = size / 2;

    const Interval interval = Interval(0.0, 0.9);

    return AnimatedBuilder(
      animation: _animationController,
      builder: (_, __) => SizedBox(
        width: size,
        height: size,
        child: Center(
          child: SizedBox(
            width: size,
            height: 0.884 * size,
            child: Stack(
              // fit: StackFit.expand,
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Transform.translate(
                    offset: Offset((size - dotDepth) / 2, 0),
                    child: BuildSides.forward(
                      rotationAngle: 2 * math.pi / 3,
                      // rotationAngle: math.pi / 2,
                      rotationOrigin: Offset(-(size - dotDepth) / 2, 0),
                      maxLength: dotLength,
                      depth: dotDepth,
                      color: color,
                      controller: _animationController,
                      interval: interval,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: BuildSides.reverse(
                    rotationAngle: math.pi / 3,
                    // rotationAngle: math.pi / 2,
                    rotationOrigin: Offset((size - dotDepth) / 2, 0),
                    maxLength: dotLength,
                    depth: dotDepth,
                    color: color,
                    controller: _animationController,
                    interval: interval,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: BuildSides.forward(
                    maxLength: dotLength,
                    depth: dotDepth,
                    color: color,
                    controller: _animationController,
                    interval: interval,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class AnimatedLoading extends StatelessWidget {
  final double size;
  final String? customText;

  const AnimatedLoading({super.key, this.size = 64, this.customText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DotsTriangle(
            color: Get.theme.primaryColor,
            size: size,
          ),
          customText != null && customText == ""
              ? Container()
              : Text(
                  customText ?? "Loading",
                  style: TextStyle(color: Get.theme.primaryColor, fontFamily: "flamaBold"),
                )
        ],
      ),
    );
  }
}



//Code by https://waterydesert.com/
//Original Package: https://pub.dev/packages/loading_animation_widget
//Modified by Louay Ghanney