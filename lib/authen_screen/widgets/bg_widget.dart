import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';

Widget bgWidget(BuildContext context, {Widget? child}) {
  return Scaffold(
    // ignore: avoid_unnecessary_containers
    body: Container(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Color(0xFFff5c30),
                  Color(0xFFe74b1a),
                ])),
          ),
          // Container(
          //   margin:
          //       EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.5),
          //   height: MediaQuery.of(context).size.height,
          //   width: MediaQuery.of(context).size.width,
          //   decoration: const BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.only(
          //           topLeft: Radius.circular(30),
          //           topRight: Radius.circular(30))),
          // ),
          Container(
            child: child,
          ),
        ],
      ),
    ),
  );
}
