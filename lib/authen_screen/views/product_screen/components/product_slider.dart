import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';

class ProductSlider extends StatefulWidget {
  final dynamic data;
  const ProductSlider({Key? key, this.data}) : super(key: key);

  @override
  State<ProductSlider> createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        VxSwiper.builder(
          autoPlay: true,
          height: 380,
          aspectRatio: 16 / 9,
          itemCount: widget.data["p_imgs"].length,
          viewportFraction: 1.0,
          itemBuilder: (context, index) {
            return Image.network(
              widget.data["p_imgs"][index],
              width: double.infinity,
              // fit: BoxFit.fitHeight,
              scale: 1.0,
            );
          },
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
        10.heightBox,
        Positioned(
          bottom: 25,
          right: 0,
          left: 0,
          child: DotsIndicator(
            dotsCount: 3,
            position: currentIndex.toDouble().round(),
            decorator: const DotsDecorator(
              color: Colors.grey,
              activeColor: primaryColor,
              size: Size.square(10.0),
              activeSize: Size.square(10.0),
              spacing: EdgeInsets.symmetric(horizontal: 4.0),
            ),
          ),
        ),
      ],
    );
  }
}

// Widget productSlider() {
//   return VxSwiper.builder(
//     autoPlay: true,
//     height: 350,
//     aspectRatio: 16 / 9,
//     itemCount: 3,
//     itemBuilder: (context, index) {
//       return Image.asset(
//         imgFc5,
//         width: double.infinity,
//         fit: BoxFit.cover,
//       );
//     },
//   ).box.make();
// }
