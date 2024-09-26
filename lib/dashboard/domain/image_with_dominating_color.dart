import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageWithDominatingColor {
  final XFile xfile;
  final Color? color;
  const ImageWithDominatingColor({required this.xfile, this.color});
}
