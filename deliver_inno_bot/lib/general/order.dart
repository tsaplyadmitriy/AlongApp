
import 'package:deliver_inno_bot/general/item.dart';
import 'package:deliver_inno_bot/util/uuid.dart';

import 'user.dart';

class Order {
  User user;
  String to;
  List<Item> what;
  int bounty;
  int cost;
  DateTime expiresAt;
  bool isHidden;
  String id;

  Order({
    this.user,
    this.to,
    this.what,
    this.bounty,
    this.cost,
    this.expiresAt,
    this.isHidden,

  }){
    id = Uuid().generateV4();
  }

  static Order getDefaultOrder() {
    return Order(
        user: User.getDefaultUser(),
        to: "To",
        what: [Item.getDefaultItem(),Item.getDefaultItem()],
        bounty: 150,
        cost: 1000,
        expiresAt: DateTime.now(),
        isHidden: false,
        );
  }
}
