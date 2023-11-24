import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';

Widget orderStatus({icon, color, title, showDone}) {
  return ListTile(
    leading: Icon(icon, color: color)
        .box
        .border(color: color)
        .roundedSM
        .padding(const EdgeInsets.all(4))
        .make(),
    trailing: SizedBox(
      width: 120,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          "$title".text.color(dartgreyColor).make(),
          showDone ? const Icon(Icons.done, color: redColor) : Container()
        ],
      ),
    ),
  );
}
