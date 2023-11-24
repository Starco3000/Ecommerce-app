import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/orders_screen/components/order_place_detail.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/orders_screen/components/orders_status.dart';
import 'package:intl/intl.dart' as intl;

class OrdersDetails extends StatelessWidget {
  final dynamic data;

  const OrdersDetails({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        titleSpacing: context.screenWidth / 4.3,
        title: "Order Details"
            .text
            .color(primaryColor)
            .fontFamily(semibold)
            .make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Column(
                children: [
                  orderStatus(
                    icon: Icons.done,
                    color: redColor,
                    title: "Placed",
                    showDone: data["order_placed"],
                  ),
                  orderStatus(
                    icon: Icons.thumb_up,
                    color: Colors.blue,
                    title: "Confirmed",
                    showDone: data["order_confirmed"],
                  ),
                  orderStatus(
                    icon: Icons.car_crash,
                    color: Colors.yellow,
                    title: "On Delivery",
                    showDone: data["order_on_delivery"],
                  ),
                  orderStatus(
                    icon: Icons.done_all_rounded,
                    color: Colors.purple,
                    title: "Delivered",
                    showDone: data["order_delivered"],
                  )
                ],
              ),
              const Divider(),
              10.heightBox,
              Column(
                children: [
                  orderPlaceDetail(
                      data1: data['order_code'],
                      data2: data['shipping_method'],
                      title1: 'Order Code',
                      title2: 'Shipping Method'),
                  orderPlaceDetail(
                      data1: intl.DateFormat()
                          .add_yMd()
                          .format((data['order_date'].toDate())),
                      data2: data['payment_method'],
                      title1: 'Order Date',
                      title2: 'Payment Method'),
                  orderPlaceDetail(
                      data1: "Unpaid",
                      data2: "Order Placed",
                      title1: 'Payment Method',
                      title2: 'Delivery Method'),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Shipping Address".text.fontFamily(semibold).make(),
                            "${data['order_by_name']}".text.make(),
                            "${data['order_by_email']}".text.make(),
                            "${data['order_by_address']}".text.make(),
                            "${data['order_by_city']}".text.make(),
                            "${data['order_by_state']}".text.make(),
                            "${data['order_by_phone']}".text.make(),
                            "${data['order_by_postalcode']}".text.make(),
                          ],
                        ),
                        SizedBox(
                          width: 130,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Total Amount".text.fontFamily(semibold).make(),
                              "${data['total_amount']}"
                                  .text
                                  .color(redColor)
                                  .fontFamily(bold)
                                  .make(),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ).box.outerShadowMd.white.make(),
              const Divider(),
              10.heightBox,
              "Ordered Product"
                  .text
                  .size(16)
                  .color(dartgreyColor)
                  .fontFamily(semibold)
                  .make(),
              10.heightBox,
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: List.generate(
                  data['orders'].length,
                  (index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        orderPlaceDetail(
                            title1: data['orders'][index]['title'],
                            title2: data['orders'][index]['totalPrice'],
                            data1: "${data['orders'][index]['quantity']}x ",
                            data2: "Refundable"),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                            width: 30,
                            height: 10,
                            color: Color(data['orders'][index]['color']),
                          ),
                        ),
                        const Divider(),
                      ],
                    );
                  },
                ).toList(),
              )
                  .box
                  .outerShadowMd
                  .white
                  .margin(const EdgeInsets.only(bottom: 4))
                  .make(),
              20.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}