import 'package:deliver_inno_bot/util/tabs.dart';
import 'package:flutter/widgets.dart';

class Keys {
  static const navScreen = Key('__navScreen__');

  //Navigation

  static const tabs = Key('__tabs__');

  static final orderItem = (String id) => Key('OrderItem__$id');
  static const orderList = Key('__orderList__');

  static const Map<AppTab, Key> tabKeyMap = {
    AppTab.available: Key('__availableTab__'),
    AppTab.taken: Key('__takenTab__'),
    AppTab.add: Key('__addTab__'),
    AppTab.mine: Key('__mineTab__'),
    AppTab.profile: Key('__profileTab__'),
  };
  static const availableTab = Key('__availableTab__');
}
