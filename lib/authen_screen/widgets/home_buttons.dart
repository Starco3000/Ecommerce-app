import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';

Widget homeButton({width, height, icon, String? title, onPress}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(icon, width: 26),
      const SizedBox(height: 10),
      title!.text.fontFamily(semibold).color(dartgreyColor).make()
    ],
  ).box.rounded.size(width!, height!).white.make();
}
