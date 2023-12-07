// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, avoid_print
import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/controllers/auth_controller.dart';
import 'package:get/get.dart';

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
  var controller = Get.find<AuthController>();
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
          validator: (value) {
            print("Title: ${widget.title}, Value: $value");

            bool emailValid = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(value!);

            // if (widget.title == name && value!.isEmpty) {
            //   return "Please enter the username";
            // }
            if (widget.title == email && value.isEmpty) {
              return "Please enter the email!";
            } else if (widget.title == email && !emailValid) {
              return "Please enter valid email";
            }
            if (widget.title == password && value.isEmpty) {
              return "Please enter the password!";
            } else if (widget.title == password && value.length < 6) {
              return "Password should be 6 characters or more";
            }

            // if (widget.title == retypePassword) {
            //   if (value == null || value.isEmpty) {
            //     return "This field cannot be empty";
            //   } else {
            //     print("Entered value: $value");
            //     print(
            //         "Original password: ${controller.passwordController.text.trim()}");
            //     if (value.trim() != controller.passwordController.text.trim()) {
            //       return "Password does not match";
            //     }
            //   }
            // }

            return null;
          },
        ),
        5.heightBox,
      ],
    );
  }
}
