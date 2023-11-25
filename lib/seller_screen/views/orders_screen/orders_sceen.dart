import 'package:ecommerce_flutter_app/seller_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/orders_screen/order_details.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/appbar_widget.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/text_style.dart';
import 'package:intl/intl.dart' as intl;

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: appbarWidget(orders),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: List.generate(
                  20,
                  (index) => ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OrderDetails()),
                      );
                    },
                    tileColor: textfieldGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    title: boldText(text: "3q45wrg463", color: purpleColor),
                    subtitle: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.calendar_month, color: fontGrey),
                            10.widthBox,
                            boldText(
                                text: intl.DateFormat()
                                    .add_yMd()
                                    .format(DateTime.now()),
                                color: fontGrey)
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.payment, color: fontGrey),
                            10.widthBox,
                            boldText(text: unpaid, color: red),
                          ],
                        )
                      ],
                    ),
                    trailing: boldText(
                        text: "\$40.0", color: purpleColor, size: 16.0),
                  ).box.margin(const EdgeInsets.only(bottom: 4)).make(),
                ),
              ),
            )));
  }
}
