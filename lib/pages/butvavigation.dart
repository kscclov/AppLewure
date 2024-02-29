import 'package:flutter/material.dart';
import 'package:lewure2_0/pages/account/account.dart';
import 'package:lewure2_0/pages/wearApp/home.dart';
import 'package:lewure2_0/pages/wearApp/search.dart';
import 'package:lewure2_0/pages/wearApp/cartAndOrder/cart.dart';


class MainPage extends StatefulWidget {

  final String nameAccount;
  final String secNameAccount;
  final String login;

  const MainPage({super.key, required this.login, required this.nameAccount, required this.secNameAccount});

  @override
  // ignore: library_private_types_in_public_api
  _MainPageState createState() => _MainPageState();
}
class _MainPageState extends State<MainPage> {

  int index = 0;

  List<Widget> buildScreens() {
    return [
      home(),
      search(),
      account(login: widget.login, secNameAccount: widget.secNameAccount, nameAccount: widget.nameAccount),
      cart(login: widget.login, secNameAccount: widget.secNameAccount, nameAccount: widget.nameAccount),
    ];
  }
  @override
  Widget build(BuildContext context) {
  List<Widget> screens = buildScreens();
  return Scaffold(
    body: screens[index],
    bottomNavigationBar: NavigationBar(
          height: 60,
          backgroundColor: Colors.white,
          selectedIndex: index,
          onDestinationSelected: (int newIndex) => 
            setState(() {
              index = newIndex;
            }),
          destinations: const [
            NavigationDestination(
            icon: Icon(Icons.shopping_bag_outlined),
            selectedIcon: Icon(Icons.shopping_bag),
            label: 'Магазин',
            ),
          NavigationDestination(
            icon: Icon(Icons.search_outlined),
            selectedIcon: Icon(Icons.search),
            label: 'Поиск',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_box_outlined),
            selectedIcon: Icon(Icons.account_box),
            label: 'Аккаунт',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined),
            selectedIcon: Icon(Icons.shopping_cart),
            label: 'Корзина',
          ),
        ],
          ),
  );
  }
}