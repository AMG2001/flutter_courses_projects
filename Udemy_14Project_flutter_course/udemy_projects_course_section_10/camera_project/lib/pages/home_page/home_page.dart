import 'dart:io';

import 'package:gallery_saver/gallery_saver.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  XFile? _image;
  String? _imageName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          /**
           * Take image from Camera
           */
          FloatingActionButton(
            onPressed: () async {
              XFile? image;

              await ImagePicker()
                  .pickImage(source: ImageSource.camera)
                  .then((value) => image = value);
              await saveImageOnDevice(File(_image!.path));
              setState(() {
                /**
                 * Assign Camera to camera class Object
                 */
                _image = image!;
                /**
                   * Get the path of the camera
                   */
                _imageName = image!.path;
              });
            },
            child: Icon(Icons.camera_alt),
          ),
          SizedBox(width: 10),
          /**
           * Take image from Gallery
           */
          GestureDetector(
            onTap: () async {
              XFile? image;
              await ImagePicker()
                  .pickImage(source: ImageSource.gallery)
                  .then((value) {
                image = value;
              });
              await saveImageOnDevice(File(_image!.path)).then(
                (value) => print("Saveing Image Done !!"),
              );

              setState(() {
                /**
                 * Assign Camera to camera class Object
                 */
                _image = image!;
                /**
                   * Get the path of the camera
                   */
                _imageName = image!.path;
              });
            },
            child: Icon(Icons.photo_library),
          ),
        ],
      ),
      appBar: AppBar(title: const Text("Home Page")),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image == null
                ? Text("No images yet !!")
                : Image.file(File(_image!.path)),
            SizedBox(height: 20),
            _imageName == null ? Text("") : Text(_imageName!),
          ],
        ),
      ),
    );
  }

  Future<void> saveImageOnDevice(File image) async {
    await GallerySaver.saveImage(image.path);
    print("Images Saved Successfully !!");
  }
}
