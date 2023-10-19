import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';

Widget featuredProducts(
    {int? itemCount,
    image,
    double? width,
    String? title,
    fontTitle,
    colorTitle,
    String? price,
    fontPrice,
    colorPrice}) {
  return Row(
    children: List.generate(
        itemCount ?? 3,
        (index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  image,
                  width: width ?? 150,
                  fit: BoxFit.fill,
                ),
                10.heightBox,
                title!.text.fontFamily(fontTitle).color(colorTitle).make(),
                10.heightBox,
                price!.text
                    .fontFamily(fontPrice)
                    .color(colorPrice)
                    .size(16)
                    .make()
              ],
            )
                .box
                .white
                .roundedSM
                .margin(const EdgeInsets.symmetric(horizontal: 4))
                .padding(const EdgeInsets.all(8))
                .make()),
  );
}
