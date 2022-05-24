import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarLearnView extends StatelessWidget {
  const AppBarLearnView({ Key? key }) : super(key: key);
  final String _title = 'AppBar Learn';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        leading: const Icon(Icons.chevron_left),
        //? appbar daki ortak property leri materialapp içine taşıyoruz.
        // centerTitle: true,
        // systemOverlayStyle: SystemUiOverlayStyle.light, //! telefonun üst kısmındaki saat bilgisi,wifi bilgisi vs temasını ayarlar
        // backgroundColor: Colors.transparent,
        //actionsIconTheme: IconThemeData(color: Colors.red,size: 25),//! appbardaki icon theme
        //toolbarTextStyle: TextStyle(color: Colors.blue), //! appbardaki textlerin style ayarları
        // automaticallyImplyLeading: false, //! otomatik gelen back butonunu false kaldırır
        elevation: 0,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.menu),),
          const Center(child: CircularProgressIndicator(),)
        ],
    ));
  }
}