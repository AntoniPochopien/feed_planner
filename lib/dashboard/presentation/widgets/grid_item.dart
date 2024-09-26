import 'dart:io';
import 'dart:math';

import 'package:feed_planner/dashboard/domain/image_with_dominating_color.dart';
import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final double animationValue;
  final ImageWithDominatingColor imageWithDominatingColor;

  const GridItem(
      {super.key,
      required this.animationValue,
      required this.imageWithDominatingColor});

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
                    File(imageWithDominatingColor.xfile.path),
                    fit: BoxFit.fitWidth,
                  )
                : imageWithDominatingColor.color == null
                    ? const Center(child: CircularProgressIndicator())
                    : Container(color: imageWithDominatingColor.color)));
  }
}
