import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/controllers/home_controller.dart';
import 'package:get/get.dart';

// Widget searchBar() {
//   return Container(
//     alignment: Alignment.center,
//     height: 60,
//     color: lightGreyColor,
//     child: Container(
//       decoration: BoxDecoration(
//         border: Border.all(color: primaryColor, width: 2.5),
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: TextFormField(
//         // cursorColor: dartgreyColor,
//         decoration: const InputDecoration(
//           prefixIcon: Icon(Icons.camera_alt_outlined),
//           suffixIcon: Icon(Icons.search),
//           filled: true,
//           fillColor: whiteColor,
//           border: InputBorder.none,
//           focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
//           contentPadding: EdgeInsets.symmetric(vertical: 12.5),
//           hintText: searchBarHint,
//           hintStyle: TextStyle(color: textfieldColor),
//         ),
//       ),
//     ),
//   );
// }

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   alignment: Alignment.topLeft,
    //   height: 60,
    //   width: MediaQuery.of(context).size.width,
    //   color: lightGreyColor,
    //   child: Container(
    //     decoration: BoxDecoration(
    //       border: Border.all(color: Colors.grey.shade300, width: 2),
    //       borderRadius: BorderRadius.circular(5),
    //     ),
    //     child: Row(
    //       children: [
    //         TextFormField(
    //           // cursorColor: dartgreyColor,
    //           decoration: const InputDecoration(
    //             prefixIcon: Icon(Icons.camera_alt_outlined),
    //             suffixIcon: Icon(Icons.search),
    //             filled: true,
    //             fillColor: whiteColor,
    //             border: InputBorder.none,
    //             focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
    //             contentPadding: EdgeInsets.symmetric(vertical: 12.5),
    //             hintText: searchBarHint,
    //             hintStyle: TextStyle(color: textfieldColor),
    //           ),
    //         ),
    //         IconButton(
    //             onPressed: () {},
    //             icon: const Icon(
    //               Icons.add_shopping_cart_outlined,
    //               color: whiteColor,
    //               size: 16,
    //             ))
    //       ],
    //     ),
    //   ),
    // );
    var controller = Get.find<HomeController>();

    return SizedBox(
      width: context.screenWidth,
      height: 45,
      child: TextFormField(
        controller: controller.searchController,
        decoration: const InputDecoration(
          hintText: "Seach....",
          hintStyle: TextStyle(
              fontFamily: semibold, fontSize: 16, color: textfieldColor),
          fillColor: searchFieldColor,
          filled: true,
          isDense: true,
          suffixIcon: Icon(Icons.search),
          suffixIconColor: greyColor,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 4),
        ),
        showCursor: false,
      ).box.outerShadowSm.make(),
    );
  }
}
