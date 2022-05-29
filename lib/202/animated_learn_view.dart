import 'package:flutter/material.dart';

class AnimatedLearnView extends StatefulWidget {
  const AnimatedLearnView({Key? key}) : super(key: key);

  @override
  State<AnimatedLearnView> createState() => _AnimatedLearnViewState();
}

class _AnimatedLearnViewState extends State<AnimatedLearnView>
    with TickerProviderStateMixin {
  bool _isVisible = false;
  bool _isOpacity = false;

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: _DurationItems.durationLow);
  }

  void _changeVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _changeOpacity() {
    setState(() {
      _isOpacity = !_isOpacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    //Text('data',style: context.textTheme().subtitle1,)
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        _changeVisibility();
        controller.animateTo(_isVisible ? 1 : 0);
      }),
      appBar: AppBar(
        title: _placeholderWidget(),
      ),
      body: Column(
        children: [
          ListTile(
              title: AnimatedOpacity(
                child: Text('data'),
                duration: _DurationItems.durationLow,
                opacity: _isOpacity ? 0 : 1,
              ),
              trailing: IconButton(
                  onPressed: () {
                    _changeOpacity();
                  },
                  icon: Icon(Icons.accessible_sharp))),
          AnimatedDefaultTextStyle(
              child: Text('DATA'),
              style: (_isVisible
                      ? context.textTheme().subtitle1
                      : context.textTheme().headline2) ??
                  TextStyle(),
              duration: _DurationItems.durationLow),
          AnimatedIcon(icon: AnimatedIcons.menu_close, progress: controller),
          AnimatedContainer(
            duration: _DurationItems.durationLow,
            height: _isVisible ? 0 : MediaQuery.of(context).size.height * .2,
            width: MediaQuery.of(context).size.width * .4,
            color: Colors.blue,
            margin: const EdgeInsets.all(10),
          ),
          Expanded(
            child: AnimatedList(itemBuilder: (context, index, animation) {
              return Text('animated list');
            }),
          ),
          Expanded(
            child: Stack(
              children: const [
                AnimatedPositioned(
                  curve: Curves.linear,
                    top: 20,
                    child: Text('Data'),
                    duration: _DurationItems.durationLow)
              ],
            ),
          ),
          Expanded(child: AnimatedExample()),
        ],
      ),
    );
  }

  AnimatedCrossFade _placeholderWidget() {
    return AnimatedCrossFade(
      firstChild: Placeholder(),
      secondChild: SizedBox.shrink(),
      crossFadeState:
          _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: _DurationItems.durationLow,
    );
  }
}

extension BuildContextExtensions on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}

class _DurationItems {
  static const durationLow = Duration(seconds: 1);
}

class AnimatedExample extends StatefulWidget {
  const AnimatedExample({Key? key}) : super(key: key);

  @override
  State<AnimatedExample> createState() => _AnimatedExampleState();
}

class _AnimatedExampleState extends State<AnimatedExample> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        _isActive = true;
      });
    });
  }

  bool _isActive = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
        firstChild: SizedBox.shrink(),
        secondChild: Container(
          margin: const EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.red,
        ),
        crossFadeState:
            _isActive ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: _DurationItems.durationLow);
  }
}
