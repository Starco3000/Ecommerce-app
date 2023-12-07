import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/controllers/home_controller.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/search_screen/search_result_screen.dart';
import 'package:get/get.dart';

class SearchInputBar extends StatelessWidget {
  const SearchInputBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();
    return Container(
      width: context.screenWidth,
      height: 45,
      decoration: BoxDecoration(
          color: whiteColor,
          border: Border.all(color: primaryColor, width: 1.5),
          borderRadius: BorderRadius.circular(8)),
      child: TextFormField(
        controller: controller.searchController,
        decoration: InputDecoration(
          hintText: "Seach....",
          hintStyle: const TextStyle(
              fontFamily: semibold, fontSize: 16, color: textfieldColor),
          filled: true,
          fillColor: whiteColor,
          isDense: true,
          suffixIcon: Container(
            color: primaryColor,
            width: 55,
            child: const Icon(
              Icons.search,
              color: whiteColor,
              size: 24,
            ).onTap(
              () {
                if (controller.searchController.text.isNotEmptyAndNotNull) {
                  Get.to(() => SearchResultScreen(
                      title: controller.searchController.text));
                }
              },
            ),
          ),
          suffixIconColor: greyColor,
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        ),
        cursorHeight: 22,
      ).box.margin(const EdgeInsets.only(left: 8)).outerShadowSm.make(),
    );
  }
}
