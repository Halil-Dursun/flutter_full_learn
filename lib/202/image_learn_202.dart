import 'package:flutter/material.dart';
import 'package:flutter_full_learn/product/global/resource_context.dart';
import 'package:provider/provider.dart';

class ImageLearn202 extends StatefulWidget {
  const ImageLearn202({Key? key}) : super(key: key);

  @override
  State<ImageLearn202> createState() => _ImageLearn202State();
}

class _ImageLearn202State extends State<ImageLearn202> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions:[
          IconButton(onPressed: (){
            context.read<ResourceContext>().clear();
          }, icon: const Icon(Icons.remove))
        ],
        title: Text(context.read<ResourceContext>().model?.data?.length.toString() ?? ''),
      ),
      body: ImagePaths.images.toWidget(height: 100),
    );
  }
}

enum ImagePaths{
  images
}

extension ImagePathsExtensions on ImagePaths{
  String path(){
    return 'assets/images/$name.png';
  }

  Widget toWidget({double height = 24}){
    return Image.asset(path(),height: height,);
  }
}