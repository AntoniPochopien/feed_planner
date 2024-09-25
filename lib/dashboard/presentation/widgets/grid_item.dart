import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final double animationValue;
  final Color dominatedColor;
  final String imagePath;
  const GridItem(
      {super.key,
      required this.animationValue,
      required this.dominatedColor,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(1),
        child: Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.002)
            ..rotateY(pi * animationValue),
          child: animationValue <= 0.5
              ? Image.file(
                  File(imagePath),
                  fit: BoxFit.fitWidth,
                )
              : Container(
                  color: dominatedColor,
                ),
        ));
  }
}
