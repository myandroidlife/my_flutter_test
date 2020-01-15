import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math';
class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double eWidth = size.width / 15;
    double eHeight = size.height / 15;

    //画棋盘背景
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill //填充
      ..color = Color(0x77cdb175); //背景为纸黄色
    canvas.drawRect(Offset.zero & size, paint);

    //画棋盘网格
    paint
      ..style = PaintingStyle.stroke //线
      ..color = Colors.black87
      ..strokeWidth = 1.0;

    for (int i = 0; i <= 15; ++i) {
      double dy = eHeight * i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint);
    }

    for (int i = 0; i <= 15; ++i) {
      double dx = eWidth * i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), paint);
    }

    //画一个黑子
    paint
      ..style = PaintingStyle.fill
      ..color = Colors.black;
    canvas.drawCircle(
      Offset(size.width / 2 - eWidth / 2, size.height / 2 - eHeight / 2),
      min(eWidth / 2, eHeight / 2) - 2,
      paint,
    );

    //画一个白子
    paint.color = Colors.white;
    canvas.drawCircle(
      Offset(size.width / 2 + eWidth / 2, size.height / 2 - eHeight / 2),
      min(eWidth / 2, eHeight / 2) - 2,
      paint,
    );
  }

  //在实际场景中正确利用此回调可以避免重绘开销，本示例我们简单的返回true
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
class DrawView extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint _paint = Paint()
      ..color = Colors.blueAccent //画笔颜色
      ..strokeCap = StrokeCap.round //画笔笔触类型
      ..isAntiAlias = true //是否启动抗锯齿
      ..blendMode = BlendMode.exclusion //颜色混合模式
      ..style = PaintingStyle.fill //绘画风格，默认为填充
      ..colorFilter = ColorFilter.mode(Colors.blueAccent,
          BlendMode.exclusion) //颜色渲染模式，一般是矩阵效果来改变的,但是flutter中只能使用颜色混合模式
    //  ..maskFilter = MaskFilter.blur(BlurStyle.inner, 3.0) //模糊遮罩效果，flutter中只有这个
      ..filterQuality = FilterQuality.high //颜色渲染模式的质量
      ..strokeWidth = 15.0; //画笔的宽度
   // canvas.drawCircle(Offset(size.width/2, size.height/2), size.width/2, _paint);
//用Rect构建一个边长50,中心点坐标为100,100的矩形
    Rect rect = Rect.fromCircle(center: Offset(100.0, 150.0), radius: 50.0);
    //根据上面的矩形,构建一个圆角矩形
    RRect rrect = RRect.fromRectAndRadius(rect, Radius.circular(20.0));
    canvas.drawRRect(rrect, _paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}




class CircleProgressBar extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //圆环
    double center = size.width*0.5;
    final Offset offsetCenter = Offset(center, center);
    Color ringColor = Color(0x55cd1317);
    var outerRadius = size.width/2-10;
    var innerRadius = outerRadius-20;
    double drawRadius = innerRadius+10;//圆圈的半径
    double  dotRadius = 15;//小圆点半径
    final ringPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = ringColor
      ..strokeWidth = (outerRadius = size.width/2-10 - innerRadius);
    canvas.drawCircle(offsetCenter, drawRadius, ringPaint);
    //进度
    num progress = 0.7;
    double progressWidth = 20;
    final angle = 360.0 * progress;
    final double radians = degToRad(angle);
    final Rect arcRect = Rect.fromCircle(center: offsetCenter, radius: drawRadius);
    var currentDotColor = Color(0xffcd1317);
    final Gradient gradient = new SweepGradient(
      endAngle: radians,
      colors: [
        Colors.white,
        currentDotColor,
      ],
    );
    final progressPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = progressWidth
    ..strokeCap = StrokeCap.round
    ..shader = gradient.createShader(arcRect);
    canvas.save();
    canvas.translate(0.0, size.width);
    canvas.rotate(degToRad(-90.0));
    var offset = asin(progressWidth * 0.5 / drawRadius);
    canvas.drawArc(arcRect, offset, degToRad(angle), false, progressPaint);
  //绘制小圆点
    var dotEdgeColor = Color(0xffcd1317);
    final double dx = center + drawRadius * sin(radians);
    final double dy = center - drawRadius * cos(radians);
    final dotPaint = Paint()..color = currentDotColor;
    canvas.drawCircle(new Offset(dx, dy), dotRadius, dotPaint);
    dotPaint
      ..color = dotEdgeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = dotRadius * 0.3;
    canvas.drawCircle(new Offset(dx, dy), dotRadius, dotPaint);
  }
  num degToRad(num deg) => deg * (pi / 180.0);
  num radToDeg(num rad) => rad * (180.0 / pi);
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}