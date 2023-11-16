import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: OutlinedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(20)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
            backgroundColor:
                MaterialStateProperty.all<Color>(Color(0xFFF5F6F9)),
            foregroundColor: MaterialStateProperty.all<Color>(dartgreyColor),
          ),
          onPressed: press,
          child: Row(
            children: [
              Image.asset(
                icon,
                width: 25,
                color: primaryColor,
              ),
              20.widthBox,
              Expanded(
                  child: Text(text,
                      textScaleFactor: 16 / 11,
                      style: Theme.of(context).textTheme.bodyLarge)),
              Image.asset(
                icArrow,
                width: 30,
                color: primaryColor,
              ),
            ],
          )),
    );
  }
}
