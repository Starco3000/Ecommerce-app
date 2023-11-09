import 'package:ecommerce_flutter_app/seller_screen/const/const.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/text_style.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back, color: darkGrey)),
        title: boldText(text: "Product title", color: fontGrey, size: 16.0),
      ),
      body: Column(
        children: [
          VxSwiper.builder(
              autoPlay: true,
              height: 350,
              itemCount: 3,
              aspectRatio: 16 / 9,
              viewportFraction: 1.0,
              itemBuilder: (context, index) {
                return Image.network(
                  imgProduct,
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              }),
          10.heightBox,
          boldText(text: "Product title", color: fontGrey, size: 16.0),
          10.heightBox,
          VxRating(
            isSelectable: false,
            value: 3.0,
            onRatingUpdate: (Value) {},
            normalColor: textfieldGrey,
            selectionColor: golden,
            count: 5,
            maxRating: 5,
            size: 25,
          )
        ],
      ),
    );
  }
}
