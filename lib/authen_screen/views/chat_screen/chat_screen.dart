import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/controllers/chat_controller.dart';
import 'package:ecommerce_flutter_app/authen_screen/services/firestore_services.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/chat_screen/components/sender_bundle.dart';
import 'package:ecommerce_flutter_app/authen_screen/widgets/loading_indicator.dart';
import 'package:get/get.dart';

// class MessagesScreen extends StatelessWidget {
//   const MessagesScreen({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     var controller = Get.put(ChatController());

//     return Scaffold(
//       backgroundColor: whiteColor,
//       appBar: AppBar(
//         backgroundColor: Colors.amber,
//         leading: IconButton(
//             onPressed: () {
//               Get.back();
//             },
//             icon: const Icon(
//               Icons.arrow_back,
//               color: primaryColor,
//               size: 26,
//             )),
//         title: "Title".text.fontFamily(semibold).color(dartgreyColor).make(),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Obx(
//               () => controller.isLoading.value
//                   ? Center(child: loadingIndicator())
//                   : Expanded(
//                       child: StreamBuilder(
//                         stream: FirestoreServices.getChatMessages(
//                             controller.chatDocId.toString()),
//                         builder: (BuildContext context,
//                             AsyncSnapshot<QuerySnapshot> snapshot) {
//                           if (!snapshot.hasData) {
//                             return Center(
//                               child: loadingIndicator(),
//                             );
//                           } else if (snapshot.data!.docs.isEmpty) {
//                             return Center(
//                               child: "Send a message..."
//                                   .text
//                                   .color(dartgreyColor)
//                                   .make(),
//                             );
//                           } else {
//                             return ListView(
//                               children: snapshot.data!.docs
//                                   .mapIndexed((currentValue, index) {
//                                 var data = snapshot.data!.docs[index];
//                                 return Align(
//                                     alignment: data['uid'] == currentUser!.uid
//                                         ? Alignment.centerRight
//                                         : Alignment.centerLeft,
//                                     child: SenderBundle(data: data));
//                               }).toList(),
//                             );
//                           }
//                         },
//                       ),
//                     ),
//             ),
//             10.heightBox,
//             Row(
//               children: [
//                 Expanded(
//                     child: TextFormField(
//                   controller: controller.msgController,
//                   decoration: const InputDecoration(
//                       border: OutlineInputBorder(
//                           borderSide: BorderSide(color: textfieldColor)),
//                       focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: textfieldColor)),
//                       hintText: "type a messages"),
//                 )),
//                 IconButton(
//                     onPressed: () {
//                       controller.sendMsg(controller.msgController.text);
//                       controller.msgController.clear();
//                     },
//                     icon: const Icon(Icons.send, color: primaryColor))
//               ],
//             )
//                 .box
//                 .height(80)
//                 .padding(const EdgeInsets.all(12))
//                 .margin(const EdgeInsets.only(bottom: 8.0))
//                 .make(),
//           ],
//         ),
//       ),
//     );
//   }
// }
class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ChatController());

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: dartgreyColor,
            size: 26,
          ),
        ),
        title: Text(
          "${controller.friendName}",
          style: const TextStyle(
            fontFamily: semibold,
            color: dartgreyColor,
          ),
        ),
      ),
      body: Container(
        color: chatBgColor,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Obx(
              () => controller.isLoading.value
                  ? Center(child: loadingIndicator())
                  : Expanded(
                      child: StreamBuilder(
                        stream: FirestoreServices.getChatMessages(
                            controller.chatDocId.toString()),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: loadingIndicator());
                          } else if (!snapshot.hasData ||
                              snapshot.data!.docs.isEmpty) {
                            return const Center(
                              child: Text(
                                "Send a message...",
                                style: TextStyle(color: dartgreyColor),
                              ),
                            );
                          } else {
                            return ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (BuildContext context, int index) {
                                var data = snapshot.data!.docs[index];
                                return Align(
                                  alignment: data['uid'] == currentUser!.uid
                                      ? Alignment.centerRight
                                      : Alignment.centerLeft,
                                  child: SenderBundle(data: data),
                                );
                              },
                            );
                          }
                        },
                      ),
                    ),
            ),
            10.heightBox,
            Container(
              color: whiteColor,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.msgController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: textfieldColor)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: textfieldColor)),
                        hintText: "Type a message",
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.sendMsg(controller.msgController.text);
                      controller.msgController.clear();
                    },
                    icon: const Icon(Icons.send, color: primaryColor),
                  ),
                ],
              )
                  .box
                  .height(80)
                  .padding(const EdgeInsets.all(12))
                  .margin(const EdgeInsets.only(bottom: 4.0))
                  .make(),
            ),
          ],
        ),
      ),
    );
  }
}
