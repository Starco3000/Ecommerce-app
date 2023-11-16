import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:flutter/services.dart';

Widget exitDialog(context) {
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        "Confirm".text.fontFamily(bold).size(18).color(dartgreyColor).make(),
        const Divider(),
        10.heightBox,
        "Are you sure you want to exit?"
            .text
            .size(16)
            .color(dartgreyColor)
            .make(),
        10.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(primaryColor)),
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: const Text("Yes").text.white.make()),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(primaryColor)),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("No").text.white.make()),
          ],
        )
      ],
    )
        .box
        .color(lightGreyColor)
        .padding(const EdgeInsets.all(12))
        .roundedSM
        .make(),
  );
}
