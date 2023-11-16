import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';

class ProductSearchBar extends StatelessWidget {
  const ProductSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      height: 40,
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: "Seach....",
          hintStyle: TextStyle(
              fontFamily: semibold, fontSize: 14, color: textfieldColor),
          fillColor: searchFieldColor,
          filled: true,
          isDense: true,
          prefixIcon: Icon(Icons.search),
          prefixIconColor: greyColor,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 9, horizontal: 4),
        ),
        showCursor: false,
      ),
    );
  }
}
