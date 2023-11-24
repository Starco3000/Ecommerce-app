import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';

Widget orderPlaceDetail({title1, title2, data1, data2}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "$title1".text.fontFamily(semibold).make(),
            "$data1".text.color(primaryColor).fontFamily(semibold).make(),
          ],
        ),
        SizedBox(
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "$title2".text.fontFamily(semibold).make(),
              "$data2".text.make()
            ],
          ),
        )
      ],
    ),
  );
}
