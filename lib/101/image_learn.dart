import 'package:flutter/material.dart';

class ImageLearn extends StatelessWidget {
  const ImageLearn({Key? key}) : super(key: key);
  final String networkImagePath = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQD476MiOOgRDVD0_zaaTVA92fi7OalhMapLw&usqp=CAU";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            width: 300,
            height: 400,
            child: PngImage(imageName: ImagePath().appleWithoutPath),
          ),
          Image.network(
            networkImagePath,
            errorBuilder: (context, error, stackTrace) => Text("Image didn't uploaded.Please check your internet connection."),
          ),
        ],
      ),
    );
  }
}

class ImagePath {
  final String appleWithBook = "assets/images/images.png";
  final String applePng = "assets/png/ic_apple.png";
  final String appleWithoutPath = "ic_apple";
}

class PngImage extends StatelessWidget {
  final String imageName;

  const PngImage({Key? key, required this.imageName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _nameToPath,
      fit: BoxFit.fill,
    );
  }

  String get _nameToPath => "assets/png/$imageName.png";
}
