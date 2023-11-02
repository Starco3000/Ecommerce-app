import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';

Widget otherProduct(
    {itemCount,
    column,
    double? mainAxis,
    double? crossAxis,
    double? itemHeight,
    itemImage,
    String? itemTitle,
    String? itemPrice}) {
  return GridView.builder(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: itemCount,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: column,
        mainAxisSpacing: mainAxis ?? 4,
        crossAxisSpacing: crossAxis ?? 4,
        mainAxisExtent: itemHeight ?? 200),
    itemBuilder: (context, index) {
      return Container(
        decoration:
            BoxDecoration(border: Border.all(color: lightGreyColor, width: 2)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              itemImage,
              height: 200,
              width: 200,
              fit: BoxFit.fill,
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  itemTitle!.text
                      .fontFamily(semibold)
                      .color(dartgreyColor)
                      .make(),
                  10.heightBox,
                  itemPrice!.text
                      .color(primaryColor)
                      .fontFamily(bold)
                      .size(16)
                      .make(),
                ],
              ),
            )
          ],
        )
            .box
            .white
            .margin(const EdgeInsets.symmetric(horizontal: 4))
            .padding(const EdgeInsets.all(4))
            .make(),
      );
    },
  );
}
