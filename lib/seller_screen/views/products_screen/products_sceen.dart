import 'package:ecommerce_flutter_app/seller_screen/const/const.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/products_screen/product_detail.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/appbar_widget.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/text_style.dart';
import 'package:get/get.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      appBar: appbarWidget(products),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: List.generate(
                20,
                (index) => ListTile(
                  onTap: () {
                    Get.to(() => const ProductDetails());
                  },
                  leading: Image.asset(imgProduct,
                      width: 100, height: 100, fit: BoxFit.cover),
                  title: boldText(text: "Product title", color: fontGrey),
                  subtitle: normalText(text: "\$40", color: darkGrey),
                  trailing: VxPopupMenu(
                    arrowSize: 0.0,
                    menuBuilder: () => Column(
                      children: List.generate(
                        popupMenuTitles.length,
                        (index) => Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Icon(PopupMenuIcons[index]),
                              10.widthBox,
                              normalText(
                                  text: popupMenuTitles[index], color: darkGrey)
                            ],
                          ).onTap(() {}),
                        ),
                      ),
                    ).box.white.rounded.width(200).make(),
                    clickType: VxClickType.singleClick,
                    child: const Icon(Icons.more_vert_rounded),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
