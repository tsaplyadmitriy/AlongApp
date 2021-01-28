import 'package:flutter/cupertino.dart';

class CupertinoFullWidthButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final GestureTapCallback onPressed;
  const CupertinoFullWidthButton({
    Key key,
    this.text = "Text",
    this.color = const Color(0xFFEBF4FF),
    this.textColor = const Color(0xFF0A78FF),
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: CupertinoButton(
        borderRadius: BorderRadius.circular(16),
        color: color,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 17.0,
            fontWeight: FontWeight.w400,
            fontFamily: 'Cannonade',
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
