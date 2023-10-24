import 'package:ecommerce_flutter_app/seller_screen/const/const.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var bottomNavbar = [
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: dashboard),
      BottomNavigationBarItem(icon: Image.asset(icProducts, color: darkGrey, width: 24), label: products),
      BottomNavigationBarItem(icon: Image.asset(icOrders, color: darkGrey, width: 24), label: orders),
      BottomNavigationBarItem(icon: Image.asset(icGeneralSettings, color: darkGrey, width: 24), label: settings),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavbar,
        selectedItemColor: purpleColor,
        unselectedItemColor: darkGrey,
      ),
      body: Column(children: [
        Expanded(child: Container()),
      ]),
    );
  }
}
