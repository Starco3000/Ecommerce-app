import 'package:card_swiper/card_swiper.dart';
import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';

class HomeSwiper extends StatelessWidget {
  const HomeSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(
            sliderList[index],
            fit: BoxFit.fill,
          );
        }
        autoplay: true,
        itemCount: sliderList.length,
        pagination: const SwiperPagination(
            alignment: Alignment.bottomCenter,
            builder: DotSwiperPaginationBuilder(
                color: Colors.white70, activeColor: primaryColor)),
      ),
    );
  }
}
