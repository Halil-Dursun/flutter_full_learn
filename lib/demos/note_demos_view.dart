import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn/101/image_learn.dart';

class NoteDemos extends StatelessWidget {
  const NoteDemos({Key? key}) : super(key: key);
  final String _title = 'Create your first project';
  final String _description = 'Add a note';
  final String _createNote = "Create a note";
  final String _importNotes = "Import Notes";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Padding(
        padding: PaddingItems.horizantalPadding,
        child: Column(
          children: [
            SizedBox(
              height: 250,
              width: double.infinity,
              child: PngImage(imageName: ImagePath().appleWithoutPath),
            ),
            _TitleWidget(title: _title),
            Padding(
              padding: PaddingItems.verticalPadding,
              child: _SubTitleWidget(
                description: _description * 10,
                textAlign: TextAlign.left,
              ),
            ),
            const Spacer(),
            _CreateButton(createNote: _createNote),
            TextButton(onPressed: (){}, child: Text(_importNotes),),
            const SizedBox(height: ButtonHeight.buttonNormalHeight,),
          ],
        ),
      ),
    );
  }
}

class _CreateButton extends StatelessWidget {
  const _CreateButton({
    Key? key,
    required String createNote,
  }) : _createNote = createNote, super(key: key);

  final String _createNote;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: SizedBox(
        height: ButtonHeight.buttonNormalHeight,
        child: Center(
          child: Text(_createNote,style: Theme.of(context).textTheme.headline5,),

        ),
      ),
    );
  }
}

class _SubTitleWidget extends StatelessWidget {
  final TextAlign textAlign;
  final String description;
  const _SubTitleWidget({
    Key? key,
    this.textAlign = TextAlign.center,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      textAlign: textAlign,
      style: Theme.of(context).textTheme.subtitle1?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .headline5
          ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
    );
  }
}

class PaddingItems {
  static const EdgeInsets horizantalPadding =
      EdgeInsets.symmetric(horizontal: 20);
  static const EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: 20);
}

class ButtonHeight{
  static const double buttonNormalHeight = 50;
}
