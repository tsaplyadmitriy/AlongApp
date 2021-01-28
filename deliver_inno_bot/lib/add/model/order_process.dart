import 'package:deliver_inno_bot/general/item.dart';
import 'package:deliver_inno_bot/general/order.dart';
import 'package:deliver_inno_bot/general/user.dart';
import 'package:flutter/cupertino.dart';

class OrderFirstPart {
  String shop;
  String adress;
  String comment;
  OrderFirstPart({
    @required this.shop,
    @required this.adress,
    this.comment = '',
  });

  OrderFirstPart.empty() : this(shop: '', adress: '');

  @override
  String toString() {
    return 'OrderFirstPart(shop: $shop, adress: $adress, comment: $comment)';
  }
}

class OrderThirdPart {
  String reward;
  String comment;
  DateTime tillDate;
  OrderThirdPart({
    @required this.reward,
    this.comment = '',
    this.tillDate,
  });

  OrderThirdPart.empty() : this(reward: '');

  @override
  String toString() =>
      'OrderThirdPart(reward: $reward, comment: $comment, tillDate: $tillDate)';
}



class OrderProcess {
  OrderFirstPart firstPart;
  List<Item> items;
  OrderThirdPart thirdPart;
  OrderProcess(
    this.firstPart,
    this.items,
    this.thirdPart,
  );


   Order toOrder(){
     //TODO correct cost calculation
     //TODO correct expiration date
    return Order(user: User.getDefaultUser(),
                  to: firstPart.adress,
                  what: items,
                  bounty: int.parse(thirdPart.reward),
                  cost: 200,
                  expiresAt: DateTime.now(),
                  isHidden: false);


  }

  @override
  String toString() =>
      firstPart.toString() +
      " " +
      items.toString() +
      " " +
      thirdPart.toString();
}
