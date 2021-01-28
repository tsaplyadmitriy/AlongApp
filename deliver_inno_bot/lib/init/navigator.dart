import 'package:deliver_inno_bot/add/add_screen.dart';
import 'package:deliver_inno_bot/add/managers/add_order_manager.dart';
import 'package:deliver_inno_bot/available/widgets/available_orders.dart';
import 'package:deliver_inno_bot/init/locator.dart';
import 'package:deliver_inno_bot/mine/widgets/mine_screen.dart';
import 'package:deliver_inno_bot/profile/widgets/profile_screen.dart';
import 'package:deliver_inno_bot/taken/widgets/taken_screen.dart';
import 'package:deliver_inno_bot/util/keys.dart';
import 'package:deliver_inno_bot/util/localization.dart';
import 'package:deliver_inno_bot/util/tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class NavigatorScreen extends StatefulWidget with GetItStatefulWidgetMixin {
  NavigatorScreen() : super(key: Keys.navScreen);

  State<StatefulWidget> createState() {
    return NavigatorScreenState();
  }
}

class NavigatorScreenState extends State<NavigatorScreen> with GetItStateMixin {
  AppTab _activeTab = AppTab.available;

  final AppTabContainer availableOrdersTab = AppTabContainer(
    widget: AvailableOrders(),
    icon: Icons.menu,
    label: "Свободные",
  );
  final AppTabContainer myOrdersTab = AppTabContainer(
    widget: MineScreen(),
    icon: Icons.arrow_circle_up_outlined,
    label: "Мои",
  );
  final AppTabContainer addOrderTab = AppTabContainer(
    widget: AddScreen(),
    icon: Icons.add,
    label: "Добавить",
  );
  final AppTabContainer takenOrdersTab = AppTabContainer(
    widget: TakenScreen(),
    icon: Icons.arrow_circle_down_outlined,
    label: "Взятые",
  );
  final AppTabContainer profileTab = AppTabContainer(
    widget: ProfileScreen(),
    icon: Icons.person,
    label: "Профиль",
  );

  @override
  Widget build(BuildContext context) {
    //it does not allow me to create a map outside a function
    final tabs = {
      AppTab.available: availableOrdersTab,
      AppTab.taken: myOrdersTab,
      AppTab.add: addOrderTab,
      AppTab.mine: takenOrdersTab,
      AppTab.profile: profileTab,
    };
    void _updateTab(AppTab tab) {
      if (tab != AppTab.add)
        setState(() {
          _activeTab = tab;
        });
      else {
        locator.get<AddOrderManager>().resetData();
        showCupertinoModalBottomSheet(
          enableDrag: false,
          expand: true,
          builder: (BuildContext context) =>
              Material(child: tabs[AppTab.add].widget),
          context: context,
        );
      }
    }

    return Scaffold(
      backgroundColor: Color(0xfff6f6f6),
      appBar: AppBar(
        title: Text(RvmsLocalizations().appTitle),
      ),
      body: tabs[_activeTab].widget,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        key: Keys.tabs,
        currentIndex: AppTab.values.indexOf(_activeTab),
        onTap: (index) {
          _updateTab(AppTab.values[index]);
        },
        items: AppTab.values.map((tab) {
          return BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(tabs[tab].icon,
                color: (tab == _activeTab) ? Colors.black : Colors.grey,
                key: Keys.tabKeyMap[tab]),

            //title is deprecated but label is not customizable
            title: Text(
              tabs[tab].label,
              style: TextStyle(
                  fontSize: 12,
                  color: (tab == _activeTab) ? Colors.black : Colors.grey),
            ),
          );
        }).toList(),
      ),
    );
  }
}

///A container for the main app tabs
class AppTabContainer {
  Widget widget;
  IconData icon;
  String label;
  AppTabContainer({
    @required this.widget,
    @required this.icon,
    @required this.label,
  });
}
