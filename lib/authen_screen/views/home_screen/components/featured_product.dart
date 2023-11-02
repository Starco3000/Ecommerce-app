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
        (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: lightGreyColor, width: 1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    image,
                    width: width ?? 150,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                  20.heightBox,
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
                  .margin(const EdgeInsets.symmetric(horizontal: 4))
                  .make(),
            )),
  );
}
