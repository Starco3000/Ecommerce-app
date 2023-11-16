// ignore_for_file: prefer_const_constructors
import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';

// Widget textFieldWidget({String? title, String? hint, controller}) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       title!.text.color(primaryColor).fontFamily(semibold).size(16).make(),
//       5.heightBox,
//       TextFormField(
//         controller: controller,
//         decoration: InputDecoration(
//             hintStyle: TextStyle(fontFamily: semibold, color: textfieldColor),
//             hintText: emailHint,
//             isDense: true,
//             fillColor: lightGreyColor,
//             filled: true,
//             border: InputBorder.none,
//             focusedBorder:
//                 OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
//             contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8)),
//       ),
//       5.heightBox,
//     ],
//   );
// }

class TextFieldWidget extends StatefulWidget {
  final String? title;
  final String? hint;
  final TextEditingController? controller;
  final bool obscureText;

  const TextFieldWidget({
    Key? key,
    this.title,
    this.hint,
    this.controller,
    this.obscureText = false,
  }) : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title!.text
            .color(primaryColor)
            .fontFamily(semibold)
            .size(16)
            .make(),
        5.heightBox,
        TextFormField(
          controller: widget.controller,
          obscureText: widget.obscureText && !_isPasswordVisible,
          decoration: InputDecoration(
            hintStyle: TextStyle(fontFamily: semibold, color: textfieldColor),
            hintText: widget.hint,
            isDense: true,
            fillColor: lightGreyColor,
            filled: true,
            border: InputBorder.none,
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: Icon(_isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  )
                : null,
          ),
        ),
        5.heightBox,
      ],
    );
  }
}
