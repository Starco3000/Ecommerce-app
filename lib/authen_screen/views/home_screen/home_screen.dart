import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/home_screen/components/home_action_icon.dart';

import 'package:ecommerce_flutter_app/authen_screen/views/home_screen/components/home_content.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/home_screen/components/home_swiper.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/home_screen/components/search_bar.dart';

class HomeScreen extends StatelessWidget {
  final dynamic data;
  const HomeScreen({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                automaticallyImplyLeading: false,
                title: const HomeSearchBar(),
                actions: [
                  HomeActionIcon(
                    data: data,
                  )
                ],
                backgroundColor:
                    innerBoxIsScrolled ? whiteColor : Colors.transparent,
                pinned: true,
              ),
            ),
          ];
        },
        body: ListView(
          shrinkWrap: true,
          children: const [
            HomeSwiper(),
            HomeContent(),
          ],
        ),
      ),
    );
  }
}
