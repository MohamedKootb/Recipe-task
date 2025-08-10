import 'package:flutter/material.dart';

import 'app_text_style.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final int? maxLines;
  final Gradient? gradient;
  const AppText(
    this.text, {
    super.key,
    this.style,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    if (gradient == null) return child;

    return ShaderMask(
      shaderCallback: (bounds) => gradient!.createShader(bounds),
      child: child,
    );
  }

  Widget get child {
    return Text(
      text,
      maxLines: maxLines,
      style: (style ?? appTextStyle()).copyWith(
        // Make sure the text color is white in case of gradient so that it gets applied properly
        color: gradient == null ? null : Colors.white,
      ),
      textAlign: textAlign,
      overflow: overflow,
    );
  }
}
