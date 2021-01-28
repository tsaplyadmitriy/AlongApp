

import 'package:deliver_inno_bot/general/order.dart';

abstract class AddOrderService {
  Future<String> getAverageReward(int price);
  Future<bool> postOrder(Order order);
}
