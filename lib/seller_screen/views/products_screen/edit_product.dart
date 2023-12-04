import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_flutter_app/seller_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/seller_screen/controllers/product_controller.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/products_screen/components/product_dropdown.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/products_screen/components/product_images.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/custome_textfield.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/loading_indicator.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/text_style.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class EditProduct extends StatelessWidget {
  final dynamic data;

  const EditProduct({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductsController>();
    controller.setInitialValues(data);
    controller.getCategories().then((_) {
      controller.populateCategoryList();
      controller.populateSubcategory(controller.categoryvalue.value);
    });
    return Obx(
      () => Scaffold(
        backgroundColor: orangeColor,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)),
          title: boldText(text: "Edit Product", size: 16.0),
          actions: [
            controller.isloading.value
                ? loadingIndicator()
                : TextButton(
                    onPressed: () async {
                      controller.isloading(true);
                      await controller.uploadImages();
                      await controller.updateProduct(data.id, context);
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
                    style: TextStyle(color: Colors.white),
                    controller: controller.pnameController),
                10.heightBox,
                customTextField(
                    hint: "eg.  nice product",
                    lable: "Description",
                    style: TextStyle(color: Colors.white),
                    isDesc: true,
                    controller: controller.pdescController),
                10.heightBox,
                customTextField(
                    hint: "eg.  \$300",
                    lable: "Price",
                    style: TextStyle(color: Colors.white),
                    controller: controller.ppriceController),
                10.heightBox,
                customTextField(
                    hint: "eg.  30",
                    lable: "Quantities",
                    style: TextStyle(color: Colors.white),
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
                            : ProductImage(label: "${index + 1}").onTap(() {
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
