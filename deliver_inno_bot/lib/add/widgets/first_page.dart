import 'package:deliver_inno_bot/add/managers/add_order_manager.dart';
import 'package:deliver_inno_bot/add/widgets/cupertino_button.dart';
import 'package:deliver_inno_bot/util/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'cupertino_text_form_field.dart';

class FirstPage extends StatelessWidget with GetItMixin {
  final _key = GlobalKey<FormState>();
  final _padding8 = EdgeInsets.only(bottom: 8.0);
  final _padding24 = EdgeInsets.only(bottom: 24.0);
  @override
  Widget build(BuildContext context) {
    final manager = get<AddOrderManager>();
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(bottom: 16, left: 16, right: 16, top: 24),
        child: Form(
          key: _key,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: _padding8,
                    child: RichText(
                      text: TextSpan(
                        text: '🏬 Магазин',
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
                    padding: _padding24,
                    child: CupertinoTextFieldForm.textRequired(
                      hintText: 'Пятёрочка',
                      initialText: manager.dataFirst.shop,
                      onChanged: (value) {
                        manager.dataFirst.shop = value;
                      },
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: _padding8,
                    child: RichText(
                      text: TextSpan(
                        text: '📍 Куда привезти',
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
                      hintText: 'Адрес',
                      initialText: manager.dataFirst.adress,
                      onChanged: (value) {
                        manager.dataFirst.adress = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: _padding8,
                    child: CupertinoFullWidthButton(
                      text: "Указать на карте",
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: _padding8,
                    child: CupertinoTextFieldForm.noCheck(
                      hintText: 'Комментарий',
                      initialText: manager.dataFirst.comment,
                      onChanged: (value) {
                        manager.dataFirst.comment = value;
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validate() => _key.currentState.validate();
}
