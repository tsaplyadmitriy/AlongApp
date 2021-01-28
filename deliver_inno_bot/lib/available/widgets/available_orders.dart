import 'package:deliver_inno_bot/available/managers/available_manager.dart';
import 'package:deliver_inno_bot/available/widgets/order_element.dart';
import 'package:deliver_inno_bot/init/locator.dart';
import 'package:deliver_inno_bot/util/keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

class AvailableOrders extends StatefulWidget with GetItStatefulWidgetMixin {
  @override
  State<StatefulWidget> createState() {
    return _AvailableOrders();
  }
}

class _AvailableOrders extends State<AvailableOrders> with GetItStateMixin {
  var isLoaded = false;

  @override
  Widget build(BuildContext context) {
    final orders =
        watchX((AvailableManager x) => x.loadOrderCommand.results).data;
    var isLoading =
        watchX((AvailableManager x) => x.loadOrderCommand.isExecuting);
    if (!isLoaded) {
      locator<AvailableManager>().loadOrderCommand.call();
      isLoaded = true;
    }
    return RefreshIndicator(
      onRefresh: () async {
        locator<AvailableManager>().loadOrderCommand.call();
      },
      child: (!isLoading)
          ? ListView.builder(
              key: Keys.orderList,
              itemCount: orders.length,
              itemBuilder: (BuildContext context, int index) {
                final order = orders[index];

                return OrderElement(
                  order: order,
                  onTap: () {
                    //TODO Open order tab with full order description
                  },
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
