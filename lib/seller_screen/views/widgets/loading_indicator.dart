import 'package:ecommerce_flutter_app/seller_screen/consts/consts.dart';

Widget loadingIndicator() {
  return const CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation(whiteColor),
  );
}
