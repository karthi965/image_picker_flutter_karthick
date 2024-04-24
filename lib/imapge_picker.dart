import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({super.key});

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  File?_imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker',style: TextStyle(fontSize: 20),),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _imageFile == null ?Text('no image selected'): Image.file(_imageFile!),
              ElevatedButton(
                onPressed: (){
                  print('image file pick form gallery button clicked');
                  _imageFrom(ImageSource.gallery);
                },
                child: Text('Image pick form gallery'),
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                print('image file pick form camara button clicked');

                _imageFrom(ImageSource.camera);

              },
                  child: Text('Image form camara')
              ),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
  void _imageFrom(ImageSource source) async{
    try {
      final pickedFile = await _picker.pickImage(source: source);
      setState(() {
        if (pickedFile != null) {
          _imageFile = File(pickedFile.path);
        } else {
          print('no image clicked');
        }
      });
    }catch(e){
      print('error image picked');

    }
  }
}
