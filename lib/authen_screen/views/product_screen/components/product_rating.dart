import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/controllers/product_controller.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/chat_screen/messages_screen.dart';
import 'package:get/get.dart';

class ProductRating extends StatelessWidget {
  final dynamic data;
  const ProductRating({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return Column(
      children: [
        SizedBox(
          height: 45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              //Rating stars
              Row(
                children: [
                  VxRating(
                    isSelectable: false,
                    value: double.parse(data['p_rating']),
                    onRatingUpdate: (value) {},
                    normalColor: textfieldColor,
                    selectionColor: golden,
                    count: 5,
                    maxRating: 5,
                    size: 22,
                  ),
                  7.widthBox,

                  //Rating score
                  "${data['p_rating']}"
                      .text
                      .fontFamily(semibold)
                      .color(dartgreyColor)
                      .size(16)
                      .make(),

                  7.widthBox,
                  Container(
                    width: 1,
                    height: context.screenHeight,
                    color: Colors.grey.shade300,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                  ),

                  7.widthBox,
                  //Product orders
                  "Đã bán 1,9K"
                      .text
                      .fontWeight(FontWeight.w600)
                      .fontFamily(regular)
                      .size(15)
                      .make(),
                ],
              ),

              //Icon Actions
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Obx(
                    () => IconButton(
                      onPressed: () {
                        if (controller.isFav.value) {
                          controller.removeFromWishList(data.id, context);
                        } else {
                          controller.addToWishList(data.id, context);
                        }
                      },
                      icon: Icon(
                        controller.isFav.value == false
                            ? Icons.favorite_border_rounded
                            : Icons.favorite,
                        color: controller.isFav.value == false
                            ? dartgreyColor
                            : redColor,
                        size: 26,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.to(
                        () => const MessagesScreen(),
                        arguments: [data['p_seller'], data['vendor_id']],
                      );
                    },
                    icon: const Icon(
                      Icons.chat_rounded,
                      color: dartgreyColor,
                      size: 26,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          width: context.screenHeight,
          height: 1,
          color: Colors.grey.shade300,
        )
      ],
    );
  }
}
