import 'package:flutter/material.dart';

class CustomDialogAvatar extends StatelessWidget {
  double padding = 16.0;
  double avatarRadius = 66.0;
  final String title, description, buttonText;
  final Function onPressed;

  CustomDialogAvatar({
    this.title,
    this.description,
    this.buttonText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: avatarRadius + padding,
              bottom: padding,
              left: padding,
              right: padding,
            ),
            margin: EdgeInsets.only(top: avatarRadius),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(padding),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 24.0),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FlatButton(
                    onPressed: onPressed,
                    child: Text(buttonText),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: padding,
            right: padding,
            child: CircleAvatar(
              backgroundColor: (title == "สำเร็จ") ? Colors.green : Colors.red,
              radius: avatarRadius,
              child: (title == "สำเร็จ")
                  ? Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 50,
                    )
                  : Icon(
                      Icons.clear,
                      color: Colors.white,
                      size: 50,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
