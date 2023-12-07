import 'package:ecommerce_flutter_app/seller_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/text_style.dart';
import 'package:intl/intl.dart' as intl;

AppBar appbarWidget(title) {
  return AppBar(
    backgroundColor: white,
    automaticallyImplyLeading: false,
    title: boldText(text: title, color: darkGrey, size: 16.0),
    actions: [
      Center(
        child: boldText(
            text: intl.DateFormat('EEE, MMM d, ' 'yy').format(DateTime.now()),
            color: purpleColor),
      ),
      10.widthBox,
    ],
  );
}
