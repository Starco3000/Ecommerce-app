// ignore_for_file: unused_local_variable

import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/controllers/home_controller.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/search_screen/search_screen.dart';
import 'package:get/get.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();

    return GestureDetector(
      onTap: () {
        Get.to(() => const SearchScreen());
      },
      child: SizedBox(
        width: context.screenWidth,
        height: 45,
        child: Container(
          decoration: BoxDecoration(
            color: searchFieldColor,
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Search....",
                style: TextStyle(
                  fontFamily: semibold,
                  fontSize: 16,
                  color: textfieldColor,
                ),
              ),
              Icon(
                Icons.search,
                color: greyColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
