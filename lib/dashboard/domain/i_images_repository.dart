import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

abstract class IImagesRepository {
  Future<Map<XFile, Color>> getDominantColorFromXFile(List<XFile> files); 
}