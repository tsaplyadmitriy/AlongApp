import 'package:deliver_inno_bot/add/managers/add_order_manager.dart';
import 'package:deliver_inno_bot/add/widgets/appbar.dart';
import 'package:deliver_inno_bot/add/widgets/bottom_chainbar.dart';
import 'package:deliver_inno_bot/add/widgets/first_page.dart';
import 'package:deliver_inno_bot/add/widgets/second_page.dart';
import 'package:deliver_inno_bot/add/widgets/third_page.dart';
import 'package:deliver_inno_bot/util/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AddScreen extends StatefulWidget with GetItStatefulWidgetMixin {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> with GetItStateMixin {
  FirstPage firstPage = FirstPage();
  SecondPage secondPage = SecondPage();
  ThirdPage thirdPage = ThirdPage();

  @override
  Widget build(BuildContext context) {
    registerHandler((AddOrderManager x) => x.postOrderCommand.isExecuting,
        (context, isExecuting, _) {
      showSpinner(context, isExecuting);
    });
    registerHandler((AddOrderManager x) => x.postOrderCommand.results,
        (context, done, _) {
      final casted = done as CommandResult<void, bool>;
      if (!get<AddOrderManager>().postOrderCommand.isExecuting.value &&
          casted.data) Navigator.of(context).pop();
    });

    final List<Widget> widgets = [firstPage, secondPage, thirdPage];
    final isAbleToCreateOrder =
        get<AddOrderManager>().isAbleToCreateOrder.value;
    final index = watchX((AddOrderManager x) => x.index);

    final header = Header(
      onLeftButtonTap: () {
        Navigator.of(context).pop();
      },
      onRightButtonTap: isAbleToCreateOrder ? thirdPage.validate : null,
      title: 'Добавить заказ',
      leftButtonText: 'Отменить',
      rightButtonText: 'Добавить',
    );

    final body = Column(
      children: [
        SizedBox(
          height: 48,
        ),
        widgets[index],
        SizedBox(
          height: 64,
        ),
      ],
    );

    final chainWidget = Positioned(
      bottom: MediaQuery.of(context).viewInsets.bottom,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: BottomChainBar(
          icons: [Icons.place, Icons.list_rounded, Icons.money_off_outlined],
          primaryColor: AppTheme.theme.accentColor,
          validators: Validators(
            firstPageOnForward: firstPage.validate,
            secondPageOnForward: secondPage.validate,
            finalPageOnOk: thirdPage.validate,
          ),
        ),
      ),
    );

    return Container(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              controller: ModalScrollController.of(context),
              child: body,
            ),
            header,
            chainWidget,
          ],
        ),
      ),
    );
  }
}

OverlayEntry spinner;

void showSpinner(BuildContext context, bool busy) {
  if (busy && spinner == null) {
    spinner = OverlayEntry(
      builder: (context) => Container(
        child: Center(
          child: CircularProgressIndicator(
            key: Key('busySpinner'),
          ),
        ),
      ),
    );
    Overlay.of(context).insert(spinner);
  } else {
    spinner?.remove();
    spinner = null;
  }
}
