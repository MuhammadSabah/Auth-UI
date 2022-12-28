import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BottomRichText extends StatelessWidget {
  const BottomRichText({
    Key? key,
    required this.onTap,
    required this.detailText,
    required this.clickableText,
    required this.color,
  }) : super(key: key);
  final Function()? onTap;
  final String detailText;
  final String clickableText;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: detailText,
                style: TextStyle(color: color),
              ),
              TextSpan(
                text: clickableText,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
                ),
                recognizer: TapGestureRecognizer()..onTap = onTap,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
