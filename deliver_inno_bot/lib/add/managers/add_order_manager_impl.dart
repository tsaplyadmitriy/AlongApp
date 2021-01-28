import 'package:deliver_inno_bot/add/managers/add_order_manager.dart';
import 'package:deliver_inno_bot/add/services/add_order_service.dart';
import 'package:deliver_inno_bot/add/model/order_process.dart';
import 'package:deliver_inno_bot/general/item.dart';
import 'package:deliver_inno_bot/init/locator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:listenable_collections/listenable_collections.dart';

class AddOrderManagerImpl extends AddOrderManager {
  AddOrderManagerImpl() {
    resetData();
    getAverageRewardCommand = Command.createAsync((x) async {
      return await locator.get<AddOrderService>().getAverageReward(x);
    }, "Loading...");

    postOrderCommand = Command.createAsyncNoParam(() async {


      return await locator.get<AddOrderService>().postOrder(order.toOrder());
    }, false);

    index.addListener(() {
      checkIfOrderCanBeCreated();
    });
  }

  @override
  void addItem(Item item) {
    _items.add(item);
  }

  @override
  ValueListenable<List<Item>> get items => _items;
  final _items = ListNotifier<Item>(data: []);

  @override
  void resetData() {
    index.value = 0;
    _items.clear();
    _items.add(Item(
      name: "adw",
      number: 3,
      priceMax: 2,
    ));
    _items.add(Item(
      name: "adw",
      number: 3,
      priceMax: 2,
    ));
    _items.add(Item(
      name: "adw",
      number: 3,
      priceMax: 2,
    ));
    _items.add(Item(
      name: "adw",
      number: 3,
      priceMax: 2,
    ));
    _items.add(Item(
      name: "adw",
      number: 3,
      priceMax: 2,
    ));
    _items.add(Item(
      name: "adw",
      number: 3,
      priceMax: 2,
    ));
    _items.add(Item(
      name: "adw",
      number: 3,
      priceMax: 2,
    ));
    _items.add(Item(
      name: "adw",
      number: 3,
      priceMax: 2,
    ));
    _items.add(Item(
      name: "adw",
      number: 3,
      priceMax: 2,
    ));
    _items.add(Item(
      name: "adw",
      number: 3,
      priceMax: 2,
    ));
    _items.add(Item(
      name: "adw",
      number: 3,
      priceMax: 2,
    ));
    _items.add(Item(
      name: "adw",
      number: 3,
      priceMax: 2,
    ));
    _items.add(Item(
      name: "adw",
      number: 3,
      priceMax: 2,
    ));
    _items.add(Item(
      name: "adw",
      number: 3,
      priceMax: 2,
    ));
    dataThird = OrderThirdPart.empty();
    dataFirst = OrderFirstPart.empty();
  }

  @override
  void startAddingItem() {
    currentItem.value = Item();
  }

  @override
  void editItem({name, number, priceMin, priceMax}) {
    currentItem.value = currentItem.value.copyWith(
        name: name, number: number, priceMax: priceMax, priceMin: priceMin);
  }

  @override
  OrderProcess get order => OrderProcess(dataFirst, items.value, dataThird);

  @override
  void checkIfOrderCanBeCreated() {
    isAbleToCreateOrder.value = index.value == 2;
  }
}
