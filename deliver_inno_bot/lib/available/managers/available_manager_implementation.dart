import 'package:deliver_inno_bot/available/managers/available_manager.dart';


import 'package:deliver_inno_bot/available/services/repository_service.dart';
import 'package:deliver_inno_bot/general/order.dart';
import 'package:deliver_inno_bot/init/locator.dart';
import 'package:flutter_command/flutter_command.dart';

class AvailableManagerImplementation implements AvailableManager {
  @override
  Command<void, List<Order>> loadOrderCommand;

  AvailableManagerImplementation() {
    loadOrderCommand = Command.createAsyncNoParam(loadOrders, []);
  }

  Future<List<Order>> loadOrders() async {
    return await locator<RepositoryService>().loadOrders();
  }
}
