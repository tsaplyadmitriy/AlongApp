

import 'package:deliver_inno_bot/general/order.dart';

abstract class RepositoryService{

  Future<List<Order>> loadOrders();


}