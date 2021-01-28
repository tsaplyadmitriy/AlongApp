import 'package:deliver_inno_bot/add/managers/add_order_manager.dart';
import 'package:deliver_inno_bot/add/widgets/appbar.dart';
import 'package:deliver_inno_bot/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import 'cupertino_text_form_field.dart';

class AddItemPage extends StatelessWidget with GetItMixin {
  AddItemPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final manager = get<AddOrderManager>();
    final _padding8 = EdgeInsets.only(bottom: 8.0);
    final _padding24 = EdgeInsets.only(bottom: 24.0);

    var filledCorrectly = watchX((AddOrderManager x) => x.currentItem).correct;
    return Column(
      children: [
        Header(
          onLeftButtonTap: () {
            Navigator.of(context).pop();
          },
          onRightButtonTap: filledCorrectly
              ? () {
                  manager.addItem(manager.currentItem.value);
                  Navigator.of(context).pop();
                }
              : null,
          title: 'Добавить товар',
          leftButtonText: 'Отменить',
          rightButtonText: 'Добавить',
        ),
        SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: _padding8,
                    child: Text(
                      "Наименование",
                      style: AppTheme.boldText24,
                    ),
                  ),
                  Padding(
                    padding: _padding24,
                    child: CupertinoTextFieldForm.noCheck(
                      hintText: 'Сыр',
                      onChanged: (value) => manager.editItem(name: value),
                    ),
                  ),
                  Padding(
                    padding: _padding8,
                    child: Text(
                      "Количество",
                      style: AppTheme.boldText24,
                    ),
                  ),
                  Padding(
                    padding: _padding24,
                    child: CupertinoTextFieldForm.noCheck(
                      textInputType: TextInputType.number,
                      hintText: '1',
                      onChanged: (value) => manager.editItem(number: value),
                    ),
                  ),
                  Padding(
                    padding: _padding8,
                    child: Text(
                      "Цена за штуку, ₽",
                      style: AppTheme.boldText24,
                    ),
                  ),
                  Padding(
                    padding: _padding8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 4.0, left: 8.0),
                              child: Text(
                                'от',
                                style: AppTheme.blackText17,
                              ),
                            ),
                            Container(
                              width:
                                  (MediaQuery.of(context).size.width - 40) / 2,
                              child: CupertinoTextFieldForm.noCheck(
                                  textInputType: TextInputType.number,
                                  hintText: '100',
                                  onChanged: (value) =>
                                      manager.editItem(priceMin: value)),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 4.0, left: 8.0),
                              child: Text(
                                'до',
                                style: AppTheme.blackText17,
                              ),
                            ),
                            Container(
                              width:
                                  (MediaQuery.of(context).size.width - 40) / 2,
                              child: CupertinoTextFieldForm.noCheck(
                                textInputType: TextInputType.number,
                                hintText: '200',
                                onChanged: (value) =>
                                    manager.editItem(priceMax: value),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Вы можете оставить одно поле пустым',
                      style: AppTheme.smallBlackText,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
