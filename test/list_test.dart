
import 'package:flutter_full_learn/303/generic_learn.dart';
import 'package:flutter_full_learn/product/widget/card/high_card.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  setUp((){});

  test('SampleTest', (){
    List<GenericUser> users =[
      GenericUser('hd', '1', 10),
      GenericUser('hd1', '2', 10),
      GenericUser('hd2', '3', 20),
    ];

    List<HighCard> highCard = users.map((e) {
      return HighCard(items: e.name.split(' ').toList());
    }).toList();

    try {
      final response = users.singleWhere((element) => element.findUserName('hd'));
      print(response);
    } catch (e) {
      print(e);
    }
  }); 
}