import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String? pathFiles;

  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Image'),
      ),
      body: Column(
        children: [
          Container(
            height: sizeWidth,
            width: sizeWidth / 2,
            child: Image.file(File(pathFiles ?? '')),
          ),
          ElevatedButton(onPressed: () {
            captureImage();
          }, child: Text('Capture Image'))
        ],
      ),
    );
  }

  Future captureImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      pathFiles = image!.path;
    });
  }
}