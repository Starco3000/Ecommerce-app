import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';

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
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      height: 60,
      width: MediaQuery.of(context).size.width,
      color: lightGreyColor,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: 2),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            TextFormField(
              // cursorColor: dartgreyColor,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.camera_alt_outlined),
                suffixIcon: Icon(Icons.search),
                filled: true,
                fillColor: whiteColor,
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: EdgeInsets.symmetric(vertical: 12.5),
                hintText: searchBarHint,
                hintStyle: TextStyle(color: textfieldColor),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add_shopping_cart_outlined,
                  color: whiteColor,
                  size: 16,
                ))
          ],
        ),
      ),
    );
  }
}
