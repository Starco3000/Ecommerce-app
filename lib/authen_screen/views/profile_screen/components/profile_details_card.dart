import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({
    Key? key,
    required this.count,
    required this.title,
  }) : super(key: key);

  final String count;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        count.text.fontFamily(bold).color(dartgreyColor).size(16).make(),
        5.heightBox,
        title.text.color(dartgreyColor).make(),
      ],
    )
        .box
        .white
        .rounded
        .width(context.screenWidth / 3.4)
        .height(80)
        .padding(const EdgeInsets.all(4))
        .make();
  }
}
