import 'package:ecommerce_flutter_app/seller_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/seller_screen/controllers/product_controller.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/products_screen/components/product_dropdown.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/products_screen/components/product_images.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/custome_textfield.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/loading_indicator.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/text_style.dart';
import 'package:get/get.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductsSellerController>();
    return Obx(
      () => Scaffold(
        backgroundColor: orangeColor,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)),
          title: boldText(text: "Add Product", size: 16.0),
          actions: [
            controller.isloading.value
                ? loadingIndicator()
                : TextButton(
                    onPressed: () async {
                      controller.isloading(true);
                      await controller.uploadImages();
                      // ignore: use_build_context_synchronously
                      await controller.uploadProduct(context);
                      Get.back();
                    },
                    child: boldText(text: "Save"))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customTextField(
                    hint: "eg.  BMW",
                    lable: "Product name",
                    style: const TextStyle(color: Colors.white),
                    controller: controller.pnameController),
                10.heightBox,
                customTextField(
                    hint: "eg.  nice product",
                    lable: "Description",
                    isDesc: true,
                    style: const TextStyle(color: Colors.white),
                    controller: controller.pdescController),
                10.heightBox,
                customTextField(
                    hint: "eg.  \$300",
                    lable: "Price",
                    style: const TextStyle(color: Colors.white),
                    controller: controller.ppriceController),
                10.heightBox,
                customTextField(
                    hint: "eg.  30",
                    style: const TextStyle(color: Colors.white),
                    lable: "Quantities",
                    controller: controller.pquantityController),
                10.heightBox,
                productDropdown("Category", controller.categoryList,
                    controller.categoryvalue, controller),
                10.heightBox,
                const Divider(color: white),
                productDropdown("Subcategory", controller.subcategoryList,
                    controller.subcategoryvalue, controller),
                boldText(text: "choose product images"),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                        3,
                        (index) => controller.pImagesList[index] != null
                            ? Image.file(controller.pImagesList[index],
                                    width: 100)
                                .onTap(() {
                                controller.pickImage(index, context);
                              })
                            : productImage(label: "${index + 1}").onTap(() {
                                controller.pickImage(index, context);
                              })),
                  ),
                ),
                5.heightBox,
                normalText(text: "first image will be your display image"),
                10.heightBox,
                Obx(
                  () => Wrap(
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
                                    .size(65, 65)
                                    .make()
                                    .onTap(() {
                                  controller.selectedColorIndex.value = index;
                                }),
                                controller.selectedColorIndex.value == index
                                    ? const Icon(
                                        Icons.done,
                                        color: white,
                                      )
                                    : const SizedBox(),
                              ],
                            )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
