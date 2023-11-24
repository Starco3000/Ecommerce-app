// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/seller_screen/const/const.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/appbar_widget.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/dashboard_button.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/text_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: appbarWidget(dashboard),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              dashboardButton(context,
                  title: products, count: "60", icon: icProducts),
              dashboardButton(context,
                  title: orders, count: "15", icon: icOrder)
            ]),
            10.heightBox,
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              dashboardButton(context,
                  title: rating, count: "60", icon: icStar),
              dashboardButton(context,
                  title: totalSalses, count: "15", icon: icOrder)
            ]),
            10.heightBox,
            const Divider(),
            10.heightBox,
            boldText(text: popular, color: darkGrey, size: 16.0),
            20.heightBox,
            ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(
                3,
                (index) => ListTile(
                  onTap: () {},
                  leading: Image.asset(imgProduct,
                      width: 100, height: 100, fit: BoxFit.cover),
                  title: boldText(text: "Product title", color: fontGrey),
                  subtitle: normalText(text: "\$40", color: darkGrey),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
