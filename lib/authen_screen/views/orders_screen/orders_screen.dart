import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/services/firestore_services.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/orders_screen/orders_details.dart';
import 'package:ecommerce_flutter_app/authen_screen/widgets/loading_indicator.dart';
import 'package:get/get.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: primaryColor,
                size: 26,
              )),
          title: "My Orders"
              .text
              .color(dartgreyColor)
              .fontFamily(semibold)
              .make()),
      body: StreamBuilder(
          stream: FirestoreServices.getAllOrders(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: loadingIndicator(),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return "No orders yet!".text.color(dartgreyColor).makeCentered();
            } else {
              var data = snapshot.data!.docs;

              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: "${index + 1}"
                        .text
                        .fontFamily(bold)
                        .color(dartgreyColor)
                        .xl
                        .make(),
                    tileColor: searchFieldColor.withOpacity(0.6),
                    title: data[index]['order_code']
                        .toString()
                        .text
                        .fontFamily(semibold)
                        .color(primaryColor)
                        .make(),
                    subtitle: data[index]['total_amount']
                        .toString()
                        .numCurrency
                        .text
                        .fontFamily(bold)
                        .make(),
                    trailing: IconButton(
                      onPressed: () {
                        Get.to(() => OrdersDetails(data: data[index]));
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: dartgreyColor,
                      ),
                    ),
                  );
                },
              );
            }
          }),
    );
  }
}
