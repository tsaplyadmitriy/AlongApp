
import 'package:deliver_inno_bot/general/order.dart';
import 'package:deliver_inno_bot/util/keys.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderElement extends StatelessWidget {
  final GestureTapCallback onTap;

  final Order order;

  OrderElement({
    @required this.onTap,
    @required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Keys.orderItem(order.id),
      child: ListTile(
        onTap: onTap,
        title: Text(
          order.user.name,
          key: Keys.orderItem(order.id),
          // style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          order.cost.toString(),
          key: Keys.orderItem(order.id),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          //style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }
}
