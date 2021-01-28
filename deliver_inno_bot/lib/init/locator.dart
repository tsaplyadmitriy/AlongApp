import 'package:deliver_inno_bot/add/managers/add_order_manager.dart';
import 'package:deliver_inno_bot/add/managers/add_order_manager_impl.dart';
import 'package:deliver_inno_bot/add/services/add_order_service.dart';
import 'package:deliver_inno_bot/add/services/add_order_service_impl.dart';
import 'package:deliver_inno_bot/available/managers/available_manager.dart';
import 'package:deliver_inno_bot/available/managers/available_manager_implementation.dart';
import 'package:deliver_inno_bot/available/services/repository_service.dart';
import 'package:deliver_inno_bot/available/services/repository_service_impl.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void initLocator() async {
  locator.registerSingleton<RepositoryService>(RepositoryServiceMock());
  locator.registerSingleton<AvailableManager>(AvailableManagerImplementation());
  locator.registerSingleton<AddOrderService>(AddOrderServiceImpl());
  locator.registerSingleton<AddOrderManager>(AddOrderManagerImpl());
}
