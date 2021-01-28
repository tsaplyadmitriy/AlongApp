import 'package:deliver_inno_bot/util/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  final String leftButtonText;
  final String rightButtonText;
  final GestureTapCallback onLeftButtonTap;
  final GestureTapCallback onRightButtonTap;

  const Header({
    Key key,
    this.title = '',
    this.leftButtonText = 'Отменить',
    this.rightButtonText = 'Подтвердить',
    @required this.onLeftButtonTap,
    @required this.onRightButtonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppTheme.theme.backgroundColor,
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                title,
                style: AppTheme.boldText17,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    onPressed: onLeftButtonTap,
                    child: Text(
                      leftButtonText,
                      style: AppTheme.accentText17,
                    ),
                  ),
                  CupertinoButton(
                    onPressed: onRightButtonTap,
                    child: Text(
                      rightButtonText,
                      style: onRightButtonTap != null
                          ? AppTheme.accentText17
                          : AppTheme.accentText17disabled,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Divider(
          indent: 0,
          height: 1,
        )
      ],
    );
  }
}
