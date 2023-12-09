import 'package:ecommerce_flutter_app/seller_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/seller_screen/controllers/product_controller.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/text_style.dart';
import 'package:get/get.dart';

class ProductDetails extends StatefulWidget {
  final dynamic data;
  const ProductDetails({super.key, this.data});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  var controller = Get.find<ProductsSellerController>();
  @override
  void initState() {
    super.initState();
    controller.is_sale.value = widget.data['is_sale'];
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back, color: darkGrey)),
          title: boldText(
              text: "${widget.data['p_name']}", color: fontGrey, size: 16.0),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VxSwiper.builder(
                  autoPlay: true,
                  height: 350,
                  itemCount: widget.data['p_imgs'].length,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1.0,
                  itemBuilder: (context, index) {
                    return Image.network(
                      widget.data['p_imgs'][index],
                      width: double.infinity,
                      fit: BoxFit.cover,
                    );
                  }),
              10.heightBox,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    boldText(
                        text: "${widget.data['p_name']}",
                        color: fontGrey,
                        size: 16.0),
                    10.heightBox,
                    Row(
                      children: [
                        boldText(
                            text: "${widget.data['p_category']}",
                            color: fontGrey,
                            size: 16.0),
                        10.widthBox,
                        normalText(
                            text: "${widget.data['p_subcategory']}",
                            color: fontGrey,
                            size: 16.0)
                      ],
                    ),
                    10.heightBox,
                    VxRating(
                      isSelectable: false,
                      value: 3.0,
                      onRatingUpdate: (Value) {},
                      normalColor: textfieldGrey,
                      selectionColor: golden,
                      count: 5,
                      maxRating: 5,
                      size: 25,
                    ),
                    10.heightBox,
                    SwitchListTile(
                        activeColor: green,
                        value: controller.is_sale.value,
                        onChanged: (value) {
                          controller.changeStatus(
                              title: "is_sale",
                              status: value,
                              docID: widget.data.id);
                          controller.is_sale.value = value;
                        },
                        title:
                            boldText(text: "Sale", color: redColor, size: 20.0),
                        controlAffinity: ListTileControlAffinity.leading),
                    boldText(
                        text: "\$${widget.data['p_price']}",
                        color: red,
                        size: 16.0),
                    Container(
                        padding: const EdgeInsets.all(8.0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                boldText(
                                    text: "Color: ",
                                    color: fontGrey,
                                    size: 16.0),
                                Expanded(
                                  child: Row(
                                    children: List.generate(
                                        widget.data['p_colors'].length,
                                        (index) => VxBox()
                                            .size(40, 40)
                                            .roundedFull
                                            .color(Color(
                                                widget.data['p_colors'][index]))
                                            .margin(const EdgeInsets.symmetric(
                                                horizontal: 4))
                                            .make()
                                            .onTap(() {})),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                boldText(
                                    text: "Quantities: ",
                                    color: fontGrey,
                                    size: 16.0),
                                normalText(
                                    text: "${widget.data['p_quantity']} items",
                                    color: fontGrey,
                                    size: 16.0),
                              ],
                            ),
                          ],
                        )),
                    20.heightBox,
                    boldText(text: "Description", color: fontGrey),
                    10.heightBox,
                    normalText(
                        text: "${widget.data['p_desc']}", color: fontGrey)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
