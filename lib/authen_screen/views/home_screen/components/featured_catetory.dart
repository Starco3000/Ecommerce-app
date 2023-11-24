import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/home_screen/components/featured_button.dart';

Widget featuredCategory({countItem, image, title}) {
  return Row(
    children: List.generate(
      countItem,
      (index) => Column(
        children: [
          featuredButton(icon: image[index], title: title[index]),
          10.heightBox
        ],
      ),
    ).toList(),
  );
}
