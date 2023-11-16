import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      child:
          "Cart is Emty!".text.fontFamily(semibold).color(dartgreyColor).make(),
    );
  }
}
