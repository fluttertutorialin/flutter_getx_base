import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

import 'package:flutter/material.dart';

class SlideSelectorPaint extends CustomPainter {
  final double a;
  final double dx;
  final int min;
  final int max;
  final BuildContext context;

  SlideSelectorPaint(this.context, this.dx, this.min, this.max, this.a);

  Paint get p => Paint()
    ..strokeWidth = 2.0
    ..color = Colors.blue;

  double get pad => 24.0;

  double dX(size) => math.min(
      math.max(dx - (MediaQuery.of(context).size.width - size.width) / 2, pad),
      size.width - pad);

  Offset off(size) => Offset(dX(size), size.center(Offset.zero).dy);

  @override
  void paint(Canvas c, Size s) {
    Offset _start = Offset(0.0, s.height / 2);
    Offset _end = Offset(s.width, s.height / 2);

    c.drawLine(_start, _end, p);

    double _aniL = dX(s) == pad ? a : 1;
    Offset _offL = Offset(0, s.height / 2) + Offset(pad, 0);
    Offset __offL = _offL + Offset(0 * _aniL, 4.0);
    c.drawCircle(_offL, 6.0, p);
    _drawText(c, __offL, 0, '$min', Colors.grey, _aniL);

    double _aniR = dX(s) == s.width - pad ? a : 1;
    Offset _offR = Offset(s.width, s.height / 2) - Offset(pad, 0);
    Offset __offR = _offR + Offset(-128.0 / 2 * _aniR, 4.0);
    c.drawCircle(_offR, 6.0, p);
    _drawText(c, __offR, 128.0, '$max', Colors.grey, _aniR);

    _drawCircle(c, s);
    _drawRect(c, s);
  }

  _drawRect(c, s) {
    double _rArc = 16.0 * a;
    Offset _oArc = off(s) + Offset(0, -_rArc * 0.5);
    c.drawArc(Rect.fromCircle(center: _oArc, radius: _rArc),
        -math.pi / 2 - math.pi / 8, math.pi / 4, true, p);

    int _value =
        min + ((dX(s) - pad) * (max - min) / (s.width - pad * 2)).ceil();

    double _w = 64.0 + (_value.toString().length * 4);
    double _h = 44.0;
    Radius _rRect = Radius.circular(8.0 * a);
    Offset _oRect = _oArc + Offset(-_w * a / 2.0, -_rArc * 0.8 - _h * a);
    Rect _outRect = Rect.fromLTWH(_oRect.dx, _oRect.dy, _w * a, _h * a);
    c.drawRRect(RRect.fromRectAndRadius(_outRect, _rRect), p);

    Offset _offText = _oRect + Offset(0, _h / 2 - 12.0);
    _drawText(c, _offText, _w, '$_value', Colors.white, a,
        s: 24.0, w: FontWeight.bold);

    Offset _offMask = off(s) - Offset(_w / 2 * (1 - a), 40.0 * (1 - a));
    _drawText(c, _offMask, _w, '$_value', Colors.blue, 1 - a,
        s: 24.0, w: FontWeight.bold);
  }

  _drawCircle(c, s) {
    c.drawCircle(off(s), 8.0, p);
    c.drawCircle(off(s), 4.0, Paint()..color = Colors.white);
  }

  _drawText(canvas, offset, width, text, color, double a,
      {s: 18.0, w: FontWeight.normal}) {
    Color? _c = color.withOpacity(math.max(math.min(a, 1.0), 0.0));
    TextPainter(
        text: TextSpan(
            text: text,
            style: TextStyle(
              fontSize: s * a,
              fontWeight: w,
              color: _c,
            )),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center)
      ..layout(minWidth: width * a, maxWidth: width * a)
      ..paint(canvas, offset);
  }

  @override
  bool shouldRepaint(SlideSelectorPaint old) => old.dx != dx || a != old.a;
}
