import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';

Widget searchBar() {
  return Container(
    alignment: Alignment.center,
    height: 60,
    color: lightGreyColor,
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor, width: 2.5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
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
    ),
  );
}
