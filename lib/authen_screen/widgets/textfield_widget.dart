// ignore_for_file: prefer_const_constructors
import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';

Widget textFieldWidget({String? title, String? hint, controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(primaryColor).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextFormField(
        decoration: InputDecoration(
            hintStyle: TextStyle(fontFamily: semibold, color: textfieldColor),
            hintText: emailHint,
            isDense: true,
            fillColor: lightGreyColor,
            filled: true,
            border: InputBorder.none,
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8)),
      ),
      5.heightBox,
    ],
  );
}
