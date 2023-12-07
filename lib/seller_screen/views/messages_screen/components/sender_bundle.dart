import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_flutter_app/seller_screen/consts/consts.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart' as intl;

class SenderBundle extends StatelessWidget {
  final DocumentSnapshot data;
  const SenderBundle({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var t = data['created_on'] == null
        ? DateTime.now()
        : data['created_on'].toDate();
    var time = intl.DateFormat("h:mma").format(t);
    return Directionality(
      textDirection: data['uid'] == currentUser!.uid
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: data['uid'] == currentUser!.uid ? primaryColor : whiteColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "${data['msg']}".text.color(dartgreyColor).size(16).make(),
            10.heightBox,
            time.text.color(dartgreyColor.withOpacity(0.5)).make(),
          ],
        ),
      ),
    );
  }
}
