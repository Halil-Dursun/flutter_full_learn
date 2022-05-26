import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/model_learn.dart';

class ModelLearnView extends StatefulWidget {
  const ModelLearnView({Key? key}) : super(key: key);

  @override
  State<ModelLearnView> createState() => _ModelLearnViewState();
}

class _ModelLearnViewState extends State<ModelLearnView> {
  var user9 = PostModel8(body: 'body');

  @override
  void initState() {
    super.initState();
    final user1 = PostModel()
    ..userId =0
    ..body = 'Vb';
    user1.body='hello'; 

    final user2 = PostModel2(2, 2, 'title', 'body');
    user2.body = 'bodyyy';

    final user3 = PostModel3(3, 3, 'title', 'body');
    //user3.body = 'ahmet'; final olduğu için değiştiremeyiz

    final user4 = PostModel4(userId: 4, id: 4, title: '2', body: 'body');
    //user4.body = 'a'; final değiştiremeyiz
    
    final user5 = PostModel5(userId: 5, id: 5, title: 'title', body: 'body');
    user5.userId;

    final user6 = PostModel6(userId: 6 , id: 6, title: 'title', body: 'body');
    user6.title;

    final user7 = PostModel7();

    //Service
    final user8 = PostModel8(body: 'body');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          user9 = user9.copyWith(title: 'vb');
          user9.updateBody('updateBody');
        });
      }),
      appBar: AppBar(
        title: Text(user9.body ?? 'Not has any data'),
      ),
    );
  }
}