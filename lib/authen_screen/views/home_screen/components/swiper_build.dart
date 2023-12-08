import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';

Widget swiperWidget({slider, double? height}) {
  return VxSwiper.builder(
    aspectRatio: 16 / 9,
    autoPlay: true,
    height: height ?? 200,
    enlargeCenterPage: true,
    viewportFraction: 1.0, // decrease to display more picture in one play
    itemCount: slider.length,
    itemBuilder: (context, index) {
      return Image.asset(
        slider[index],
        fit: BoxFit.fill,
      )
          .box
          .rounded
          .clip(Clip.antiAlias)
          .margin(const EdgeInsets.symmetric(horizontal: 8))
          .make();
    },
  );
}
