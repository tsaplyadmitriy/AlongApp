import 'package:deliver_inno_bot/add/model/order_process.dart';
import 'package:deliver_inno_bot/add/services/add_order_service.dart';
import 'package:deliver_inno_bot/available/services/repository_service_impl.dart';
import 'package:deliver_inno_bot/general/order.dart';

class AddOrderServiceImpl extends AddOrderService {
  @override
  Future<String> getAverageReward(int price) async {
    return await Future.delayed(Duration(milliseconds: 2000), () async {
      return price.toString();
    });
  }

  @override
  Future<bool> postOrder(Order order) async {
    await Future.delayed(Duration(milliseconds: 200));
    database.add(order);

    print(order);
    return true;
  }
}
