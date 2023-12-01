import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';

Widget mainButtonWidget({color, textColor, title, onPress}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.all(12),
      ),
      onPressed: onPress,
      child: Text(title,
          style:
              TextStyle(color: textColor, fontFamily: 'bold', fontSize: 16)));
}
