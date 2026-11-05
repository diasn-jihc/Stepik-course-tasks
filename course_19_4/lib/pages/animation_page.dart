import 'dart:math';

import 'package:flutter/material.dart';

class AnimationPage extends StatelessWidget {
  const AnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AnimationWidget(),
      ),
    );
  }
}

class AnimationWidget extends StatefulWidget {
  const AnimationWidget({super.key});

  @override
  State<AnimationWidget> createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotation;
  late Animation<double> opacity;
  late Animation<double> moveDown;
  late Animation<double> scale;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );

    rotation = Tween(begin: 0.0, end: 2 * pi).animate(
      CurvedAnimation(parent: controller, curve: Curves.bounceOut),
    );

    opacity = Tween(begin: 0.1, end: 1.0).animate(controller);

    moveDown = Tween(begin: 0.0, end: 200.0).animate(controller);

    scale = Tween(begin: 0.0, end: 1.0).animate(controller);

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.repeat();
      }
      // } else if (controller.status == AnimationStatus.dismissed) {
      //   controller.forward();
      // }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.repeat();

    return AnimatedBuilder(
      animation: controller,
      child: const MyContainer(),
      builder: (context, childContainer) {
        //print(rotation.value);
        return Transform.translate(
          offset: Offset(0.0, moveDown.value),
          child: Transform.rotate(
            angle: rotation.value,
            child: Opacity(
              opacity: opacity.value,
              child: Transform.scale(
                scale: scale.value,
                child: childContainer,
              ),
            ),
          ),
        );
      },
    );
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: const BoxDecoration(
        color: Colors.orange,
      ),
    );
  }
}
