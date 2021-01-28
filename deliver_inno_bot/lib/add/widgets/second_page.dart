import 'package:deliver_inno_bot/add/managers/add_order_manager.dart';
import 'package:deliver_inno_bot/add/model/order_process.dart';
import 'package:deliver_inno_bot/add/widgets/add_item_page.dart';
import 'package:deliver_inno_bot/add/widgets/cupertino_button.dart';
import 'package:deliver_inno_bot/general/item.dart';
import 'package:deliver_inno_bot/init/locator.dart';
import 'package:deliver_inno_bot/util/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SecondPage extends StatelessWidget with GetItMixin {
  @override
  Widget build(BuildContext context) {
    final items = watchX((AddOrderManager x) => x.items);

    return Padding(
      padding:
          EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0, top: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: RichText(
              text: TextSpan(
                text: '📝 Товары',
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
            padding: const EdgeInsets.only(bottom: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: items.isNotEmpty ? Colors.grey[200] : Colors.transparent,
                child: items.isNotEmpty
                    ? Column(
                        children: items
                            .map((item) => ItemWidget(item: item))
                            .toList(),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Пока не добавлено товаров",
                            style: AppTheme.greyText17lowOpacity,
                          ),
                        ),
                      ),
              ),
            ),
          ),
          CupertinoFullWidthButton(
            text: "Добавить",
            onPressed: () {
              get<AddOrderManager>().startAddingItem();
              showCupertinoModalBottomSheet(
                expand: true,
                builder: (BuildContext context) {
                  return Material(
                    child: AddItemPage(),
                  );
                },
                context: context,
              );
            },
          )
        ],
      ),
    );
  }

  bool validate() => locator.get<AddOrderManager>().items.value.length > 0;
}

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var priceText = "";
    if (item.priceMin != null) priceText += "от ${item.priceMin} ";
    if (item.priceMax != null)
      priceText += "до ${item.priceMax}";
    else
      priceText = priceText.substring(0, priceText.length - 1);

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppTheme.theme.backgroundColor),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${item.number} × ${item.name}",
              style: AppTheme.blackText17,
            ),
            Text(
              priceText,
              style: AppTheme.blackText17,
            ),
          ],
        ),
      ),
    );
  }
}
