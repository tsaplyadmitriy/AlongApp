
import 'package:deliver_inno_bot/available/services/repository_service.dart';
import 'package:deliver_inno_bot/general/order.dart';


List<Order> database = [    Order.getDefaultOrder(),
  Order.getDefaultOrder(),
  Order.getDefaultOrder(),];

class RepositoryServiceMock implements RepositoryService {


  

  @override
  Future<List<Order>> loadOrders() async {
    return await loadMockOrders();
  }

  Future<List<Order>> loadMockOrders() async {
    await Future.delayed(Duration(milliseconds: 500), () async {
      print("Loading orders list (mock)");
    });

    return database;
  }
}
