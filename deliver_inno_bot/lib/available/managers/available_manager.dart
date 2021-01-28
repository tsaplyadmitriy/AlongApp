
import 'package:deliver_inno_bot/general/order.dart';
import 'package:flutter_command/flutter_command.dart';

abstract class AvailableManager {
  Command<void, List<Order>> loadOrderCommand;
}

enum VisibilityFilter { all, active, completed }
