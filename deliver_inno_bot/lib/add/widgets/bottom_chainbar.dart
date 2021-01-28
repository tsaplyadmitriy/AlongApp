import 'package:deliver_inno_bot/add/managers/add_order_manager.dart';
import 'package:deliver_inno_bot/init/locator.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

class BottomChainBar extends StatefulWidget with GetItStatefulWidgetMixin {
  ///A list of icons to be displayed
  final List<IconData> icons;

  final Validators validators;

  ///Primary color of a Widget
  final Color primaryColor;

  ///Background color of the Widget
  final Color backgroundColor;

  ///Color of Icon when the current page is open
  final Color selectedIconColor;

  ///Color of Icons whose corresponding pages are not open
  final Color unselectedIconColor;

  final Color splashColor;

  ///Index of a page to open on
  final int initialIndex;

  BottomChainBar({
    @required this.icons,
    @required this.validators,
    this.primaryColor = const Color(0xFF0A78FF),
    this.backgroundColor = const Color(0xFFFFFFFF),
    this.selectedIconColor = const Color(0xFF0A78FF),
    this.unselectedIconColor = const Color(0xFF000000),
    this.initialIndex = 0,
    this.splashColor,
  })  : assert(icons.length == 3),
        assert(validators != null);

  @override
  _BottomChainBarState createState() => _BottomChainBarState();
}

class _BottomChainBarState extends State<BottomChainBar> with GetItStateMixin {
  final maxIndex = 2;
  final size = 48.0;
  var isLastPage = false;
  var nextButton, okButton;

  Widget _createIcon(int i, int currentIndex, EdgeInsets padding) {
    return Padding(
      padding: padding,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.backgroundColor,
            boxShadow: [
              BoxShadow(
                spreadRadius: 1,
                color: Colors.grey[400],
                blurRadius: 10,
              )
            ]),
        child: Center(
          child: Icon(
            widget.icons[i],
            color: (i == currentIndex)
                ? widget.primaryColor
                : widget.unselectedIconColor,
            size: 20.0,
          ),
        ),
      ),
    );
  }

  void _goNext(int index) {
    if (index == 0
        ? widget.validators.firstPageOnForward()
        : widget.validators.secondPageOnForward()) {
      locator.get<AddOrderManager>().index.value++;
    }
  }

  void _goBack(int index) {
    locator.get<AddOrderManager>().index.value--;
  }

  void _finalize() {
    widget.validators.finalPageOnOk();
  }

  @override
  Widget build(BuildContext context) {
    var index = watchX((AddOrderManager x) => x.index);
    Widget icons = Row(
      children: [
        _createIcon(0, index, EdgeInsets.only(right: 8.0)),
        _createIcon(1, index, EdgeInsets.symmetric(horizontal: 8.0)),
        _createIcon(2, index, EdgeInsets.only(left: 8.0)),
      ],
    );

    // nextButton = Ink(
    //   height: size,
    //   width: size,
    //   decoration: BoxDecoration(
    //     color: widget.primaryColor,
    //     shape: BoxShape.circle,
    //   ),
    //   child: IconButton(
    //     icon: Icon(Icons.arrow_forward_ios_rounded),
    //     color: Colors.white,
    //     onPressed: () => _goNext(index),
    //   ),
    // );

    nextButton = ClipOval(
      child: Material(
        color: widget.primaryColor, // button color
        child: InkWell(
          splashColor: widget.splashColor, // inkwell color
          child: SizedBox(
            width: size,
            height: size,
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
            ),
          ),
          onTap: () => _goNext(index),
        ),
      ),
    );
    // okButton = Ink(
    //   key: UniqueKey(),
    //   height: size,
    //   width: size,
    //   decoration: BoxDecoration(
    //     color: widget.primaryColor,
    //     shape: BoxShape.circle,
    //   ),
    //   child: IconButton(
    //     icon: Icon(Icons.done_rounded),
    //     color: Colors.white,
    //     onPressed: _finalize,
    //   ),
    // );

    okButton = ClipOval(
      key: UniqueKey(),
      child: Material(
        color: widget.primaryColor, // button color
        child: InkWell(
          splashColor: widget.splashColor, // inkwell color
          child: SizedBox(
            width: size,
            height: size,
            child: Icon(Icons.done_rounded, color: Colors.white),
          ),
          onTap: _finalize,
        ),
      ),
    );

    // final backButton = Ink(
    //   height: size,
    //   width: size,
    //   decoration: BoxDecoration(
    //     color: (index == 0)
    //         ? widget.primaryColor.withOpacity(0.3)
    //         : widget.primaryColor,
    //     shape: BoxShape.circle,
    //   ),
    //   child: IconButton(
    //     focusColor: Colors.red,
    //     icon: Icon(Icons.arrow_back_ios_rounded),
    //     color: Colors.white,
    //     onPressed: (index > 0) ? () => _goBack(index) : null,
    //   ),
    // );

    final backButton = ClipOval(
      child: Material(
        color: (index == 0)
            ? widget.primaryColor.withOpacity(0.3)
            : widget.primaryColor,
        child: InkWell(
          splashColor: widget.splashColor, // inkwell color
          child: SizedBox(
              width: size,
              height: size,
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white,
              )),
          onTap: (index > 0) ? () => _goBack(index) : null,
        ),
      ),
    );

    return Material(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          backButton,
          icons,
          AnimatedSwitcher(
              child: (index == maxIndex) ? okButton : nextButton,
              duration: Duration(
                milliseconds: 250,
              ),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(child: child, scale: animation);
              }),
        ],
      ),
    );
  }
}

class Validators {
  @required
  bool Function() firstPageOnForward;
  @required
  bool Function() secondPageOnForward;
  bool Function() secondPageOnBack = () => true;
  @required
  void Function() finalPageOnOk;
  bool Function() finalPageOnBack = () => true;
  Validators({
    this.firstPageOnForward,
    this.secondPageOnForward,
    this.secondPageOnBack,
    this.finalPageOnOk,
    this.finalPageOnBack,
  })  : assert(firstPageOnForward != null),
        assert(secondPageOnForward != null),
        assert(finalPageOnOk != null);
}
