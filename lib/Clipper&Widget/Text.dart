import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color color;

  const TextTitle({
    Key key,
    this.text,
    this.style,
    this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
        padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
        child: Row(
          children: [
            Text(
              text,
              style: style,
            ),
          ],
        ),
      ),
    ]);
  }
}
