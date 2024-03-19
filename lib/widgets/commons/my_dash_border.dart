import 'dart:math';

import 'package:bizcotap/utils/app_exports.dart';

class MyDashedBorder extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;
  final double borderRadius;

  MyDashedBorder({
    required this.color,
    required this.strokeWidth,
    required this.dashWidth,
    required this.dashSpace,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final Path path = Path();

    // Top border
    for (double i = 0;
        i < size.width - borderRadius;
        i += dashWidth + dashSpace) {
      path.moveTo(i, 0);
      path.lineTo(i + dashWidth, 0);
    }
    // Top-right corner
    path.addArc(
        Rect.fromPoints(
          Offset(size.width - borderRadius, 0),
          Offset(size.width, borderRadius),
        ),
        -pi / 2,
        pi / 2);

    // Right border
    for (double i = 0;
        i < size.height - borderRadius;
        i += dashWidth + dashSpace) {
      path.moveTo(size.width, i);
      path.lineTo(size.width, i + dashWidth);
    }
    // Bottom-right corner
    path.addArc(
        Rect.fromPoints(
          Offset(size.width - borderRadius, size.height - borderRadius),
          Offset(size.width, size.height),
        ),
        0,
        pi / 2);

    // Bottom border
    for (double i = size.width; i > borderRadius; i -= dashWidth + dashSpace) {
      path.moveTo(i - dashWidth, size.height);
      path.lineTo(i, size.height);
    }
    // Bottom-left corner
    path.addArc(
        Rect.fromPoints(
          Offset(0, size.height - borderRadius),
          Offset(borderRadius, size.height),
        ),
        pi / 2,
        pi / 2);

    // Left border
    for (double i = size.height; i > borderRadius; i -= dashWidth + dashSpace) {
      path.moveTo(0, i - dashWidth);
      path.lineTo(0, i);
    }
    // Top-left corner
    path.addArc(
        Rect.fromPoints(
          const Offset(0, 0),
          Offset(borderRadius, borderRadius),
        ),
        pi,
        pi / 2);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
