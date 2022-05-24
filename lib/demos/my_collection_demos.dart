import 'package:flutter/material.dart';

class MyCollectionsDemos extends StatefulWidget {
  const MyCollectionsDemos({Key? key}) : super(key: key);

  @override
  State<MyCollectionsDemos> createState() => _MyCollectionsDemosState();
}

class _MyCollectionsDemosState extends State<MyCollectionsDemos> {
  late final List<CollectionModel> _items;

  @override
  void initState() {
    super.initState();
    _items  = CollectionItems().items;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: ((context, index) {
        return Padding(
          padding: PaddingUtility().paddingHorizantal,
          child: _CategoyCard(model: _items[index],),
        );
      })),
    );
  }
}

class _CategoyCard extends StatelessWidget {
  const _CategoyCard({
    Key? key,
    required CollectionModel model,
  }) : _model = model, super(key: key);

  final CollectionModel _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: PaddingUtility().paddingBottom,
      child: SizedBox(
        height: 300,
        child: Padding(
          padding: PaddingUtility().paddingGeneral,
          child: Column(
            children: [
              Expanded(child: Image.network(_model.imagePath,fit: BoxFit.fill,)),
              Padding(
                padding: PaddingUtility().paddingTop,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_model.title),
                    Text('${_model.price} eth')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CollectionModel {
  final String imagePath;
  final String title;
  final double price;
  CollectionModel({
    required this.imagePath,
    required this.title,
    required this.price,
  });
}
class CollectionItems{
  late final List<CollectionModel> items;

  CollectionItems(){
    items = [
      CollectionModel(imagePath: ProjectImages.imageCollection, title: 'Abstract Art', price: 3.4),
      CollectionModel(imagePath: ProjectImages.imageCollection, title: 'Abstract Art2', price: 3.4),
      CollectionModel(imagePath: ProjectImages.imageCollection, title: 'Abstract Art3', price: 3.4),
      CollectionModel(imagePath: ProjectImages.imageCollection, title: 'Abstract Art4', price: 3.4),
    ];
  }
}

class PaddingUtility{
  final paddingHorizantal = const EdgeInsets.symmetric(horizontal: 20);
  final paddingBottom = const EdgeInsets.only(bottom: 20);
  final paddingGeneral =const EdgeInsets.all(20.0);
  final paddingTop = const EdgeInsets.only(top:15.0);
}

class ProjectImages{
  static const imageCollection = 'https://picsum.photos/200/300';
}
