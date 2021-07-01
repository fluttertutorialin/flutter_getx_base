import 'package:flutter/material.dart';
import 'package:flutter_getx_base/presentation/animation/silder/slider_selector_paint.dart';
import 'package:flutter_getx_base/resources/widgets/base_widget.dart';

import 'animations_controller.dart';

class AnimationsScreen extends BaseScaffold<AnimationsController> {
  @override
  String title() {
    return 'Animation demo';
  }

  @override
  Widget buildChild(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text('Slider Animation'),
          ),
          Flexible(child: SliderSelectorView())
        ],
      ),
    );
  }
}

class SliderSelectorView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SliderSelectorViewState();
}

class _SliderSelectorViewState extends State<SliderSelectorView>
    with TickerProviderStateMixin {
  double x = 0;

  late AnimationController c;
  late Animation a;

  @override
  void initState() {
    super.initState();
    c = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    a = CurvedAnimation(
        parent: c, curve: Curves.easeOutBack, reverseCurve: Curves.easeInCirc);
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double _width = s.width;
    double _height = s.height;
    return Container(
      width: _width,
      height: _height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          AnimatedBuilder(
              animation: a,
              builder: (context, child) {
                return CustomPaint(
                    size: Size(_width, _height),
                    painter: SlideSelectorPaint(context, x, 0, 10000, a.value));
              }),
          GestureDetector(
              child: Container(
                  color: Colors.transparent, height: 12, width: s.width),
              onHorizontalDragStart: (_) => c.forward(),
              onHorizontalDragEnd: (_) => c.reverse(),
              onHorizontalDragUpdate: (e) =>
                  setState(() => x = e.globalPosition.dx))
        ],
      ),
    );
  }
}
