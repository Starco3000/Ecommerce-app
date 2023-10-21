import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';

Widget productSlider() {
  return VxSwiper.builder(
      autoPlay: true,
      height: 350,
      aspectRatio: 16 / 9,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Image.asset(
          imgFc5,
          width: double.infinity,
          fit: BoxFit.cover,
        );
      }).box.make();
}
