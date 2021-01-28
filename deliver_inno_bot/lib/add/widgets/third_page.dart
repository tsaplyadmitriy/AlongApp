import 'package:deliver_inno_bot/add/managers/add_order_manager.dart';
import 'package:deliver_inno_bot/init/locator.dart';
import 'package:deliver_inno_bot/util/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import 'cupertino_text_form_field.dart';

class ThirdPage extends StatelessWidget with GetItMixin {
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final manager = get<AddOrderManager>();
    var averageReward =
        watchX((AddOrderManager x) => x.getAverageRewardCommand.results).data;
    manager.getAverageRewardCommand.execute(50);
    final _padding8 = EdgeInsets.only(bottom: 8.0);
    final _padding24 = EdgeInsets.only(bottom: 24.0);
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(bottom: 16, left: 16, right: 16, top: 24),
        child: Form(
          key: _key,
          child: Column(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: _padding8,
                  child: RichText(
                    text: TextSpan(
                      text: '🏆 Величина награды',
                      style: AppTheme.boldText24,
                      children: [
                        TextSpan(
                          text: '*',
                          style: AppTheme.redText,
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: _padding8,
                  child: CupertinoTextFieldForm.textRequired(
                    hintText: '100',
                    initialText: manager.dataThird.reward,
                    onChanged: (value) {
                      manager.dataThird.reward = value;
                    },
                    textInputType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: _padding24,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Средняя награда сейчас = $averageReward",
                      style: AppTheme.greyText14lowOpacity,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: _padding8,
                  child: Text(
                    '💬 Комментарий курьеру',
                    style: AppTheme.boldText24,
                  ),
                ),
                Padding(
                  padding: _padding24,
                  child: CupertinoTextFieldForm.noCheck(
                    hintText: "Оплата: онлине",
                    initialText: manager.dataThird.comment,
                    onChanged: (value) => manager.dataThird.comment = value,
                  ),
                ),
                Padding(
                  padding: _padding8,
                  child: FlatButton(
                    child: Text('Choose Date'),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  void validate() {
    if (_key.currentState.validate()) {
      locator.get<AddOrderManager>().postOrderCommand.call();
    }
  }
}
