import 'package:flutter/material.dart';

import '../theming/app_colors.dart';

class DottedDivider extends StatelessWidget {
  final double thickness;
  final double dashWidth;
  final double dashSpace;
  final Color color;
  final EdgeInsetsGeometry? margin;

  const DottedDivider({
    super.key,
    this.thickness = 1.5,
    this.dashWidth = 5,
    this.dashSpace = 4,
    this.color = AppColors.black,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final divider = SizedBox(
      width: double.infinity,
      height: thickness,
      child: CustomPaint(
        painter: _DottedLinePainter(
          color: color,
          thickness: thickness,
          dashWidth: dashWidth,
          dashSpace: dashSpace,
        ),
      ),
    );

    if (margin == null) return divider;

    return Padding(padding: margin!, child: divider);
  }
}

class _DottedLinePainter extends CustomPainter {
  final Color color;
  final double thickness;
  final double dashWidth;
  final double dashSpace;

  _DottedLinePainter({
    required this.color,
    required this.thickness,
    required this.dashWidth,
    required this.dashSpace,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..strokeWidth = thickness
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    double startX = 0;
    final y = size.height / 2;
    while (startX < size.width) {
      final endX = (startX + dashWidth).clamp(0.0, size.width);
      canvas.drawLine(Offset(startX, y), Offset(endX, y), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
