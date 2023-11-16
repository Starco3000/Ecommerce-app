import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/seller_screen/const/colors.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/products_screen/components/product_dropdown.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/products_screen/components/product_images.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/custome_textfield.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/text_style.dart';
import 'package:get/get.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: orangeColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
        title: boldText(text: "Add Product", size: 16.0),
        actions: [TextButton(onPressed: () {}, child: boldText(text: "Save"))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customTextField(hint: "eg.  BMW", lable: "Product name"),
              10.heightBox,
              customTextField(
                  hint: "eg.  nice product",
                  lable: "Description",
                  isDesc: true),
              10.heightBox,
              customTextField(hint: "eg.  \$300", lable: "Price"),
              10.heightBox,
              customTextField(hint: "eg.  30", lable: "Quantities"),
              10.heightBox,
              productDropdown(),
              10.heightBox,
              const Divider(color: white),
              boldText(text: "choose product images"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                    3, (index) => ProductImage(label: "${index + 1}")),
              ),
              5.heightBox,
              normalText(text: "first image will be your display image"),
              10.heightBox,
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: List.generate(
                    9,
                    (index) => Stack(
                          alignment: Alignment.center,
                          children: [
                            VxBox()
                                .color(Vx.randomPrimaryColor)
                                .roundedFull
                                .size(70, 70)
                                .make(),
                            const Icon(
                              Icons.done,
                              color: white,
                            )
                          ],
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
