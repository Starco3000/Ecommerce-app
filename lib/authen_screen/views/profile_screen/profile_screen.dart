import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/controllers/profile_controller.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/profile_screen/components/body.dart';
import 'package:ecommerce_flutter_app/authen_screen/widgets/bg_widget.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());

    return bgWidget(
      context,
      child: Scaffold(
        appBar: AppBar(title: profileTitle.text.fontFamily(bold).white.make()),
        body: const Body(),
      ),
    );
  }
}
