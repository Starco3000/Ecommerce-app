import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';

Widget applogoWidget() {
  return Image.asset(icAppLogo)
      .box
      .white
      .size(77, 77)
      .padding(const EdgeInsets.all(8))
      .rounded
      .make();
}
