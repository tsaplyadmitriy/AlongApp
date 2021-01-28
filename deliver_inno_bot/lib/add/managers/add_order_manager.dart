import 'package:deliver_inno_bot/add/model/order_process.dart';
import 'package:deliver_inno_bot/general/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_command/flutter_command.dart';

abstract class AddOrderManager {
  ValueListenable<List<Item>> get items;
  Command<int, String> getAverageRewardCommand;
  Command<void, bool> postOrderCommand;

  ValueNotifier<int> index = ValueNotifier(0);
  ValueNotifier<bool> isAbleToCreateOrder = ValueNotifier(false);
  OrderFirstPart dataFirst;
  OrderThirdPart dataThird;
  OrderProcess get order;
  ValueNotifier<Item> currentItem = ValueNotifier(Item());
  void editItem({
    String name,
    String number,
    String priceMin,
    String priceMax,
  });

  void startAddingItem();

  void resetData();

  void addItem(Item item);

  void checkIfOrderCanBeCreated();
}
