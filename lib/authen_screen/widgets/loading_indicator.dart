import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';

Widget loadingIndicator() {
  return const CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation(primaryColor),
  );
}
