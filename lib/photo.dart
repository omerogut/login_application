import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(PicPlace());
}

class PicPlace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Photo Picker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PicPlaceHomePage(),
    );
  }
}

class PicPlaceHomePage extends StatefulWidget {
  @override
  _PicPlaceHomePageState createState() => _PicPlaceHomePageState();
}

class _PicPlaceHomePageState extends State<PicPlaceHomePage> {
  List<FileData> _images = [];

  final picker = ImagePicker();

  Future getImageFromCamera() async {
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _images.add(FileData(imageFile: File(pickedImage.path), dateTime: DateTime.now()));
      });
    }
  }

  Future getImageFromGallery() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _images.add(FileData(imageFile: File(pickedImage.path), dateTime: DateTime.now()));
      });
    }
  }

  void _viewImage(FileData data) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: SizedBox(
                  width: double.infinity,
                  child: data.imageFile != null ? Image.file(data.imageFile!, fit: BoxFit.cover) : Placeholder(),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Yükleme Tarihi: ${data.dateTime.toString()}',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Picker'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: getImageFromCamera,
                    child: Text('Kamera'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: getImageFromGallery,
                    child: Text('Galeri'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              for (var image in _images)
                GestureDetector(
                  onTap: () => _viewImage(image),
                  child: Container(
                    margin: EdgeInsets.all(8), // Boşluk eklemek için
                    width: 300,
                    height: 300,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        if (image.imageFile != null)
                          Image.file(image.imageFile!, fit: BoxFit.cover)
                        else
                          Placeholder(),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            color: Colors.black54,
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            child: Text(
                              'Yükleme Tarihi: ${image.dateTime.toString()}',
                              style: TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class FileData {
  final File? imageFile;
  final DateTime dateTime;

  FileData({required this.imageFile, required this.dateTime});
}
