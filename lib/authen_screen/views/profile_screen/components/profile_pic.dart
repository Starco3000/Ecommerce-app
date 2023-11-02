import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 80,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage(imgProfile2),
          ),
          Positioned(
            right: -6,
            bottom: 0,
            child: SizedBox(
              height: 34,
              width: 34,
              child: ElevatedButton(
                  style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    side: MaterialStateProperty.all<BorderSide>(
                        BorderSide(color: whiteColor)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFFF5F6F9)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(dartgreyColor),
                  ),
                  onPressed: () {},
                  child: const Icon(Icons.camera_alt_outlined)),
            ),
          )
        ],
      ),
    );
  }
}
