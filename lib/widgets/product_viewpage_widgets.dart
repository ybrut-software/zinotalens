import 'package:flutter/material.dart' hide Colors;
import 'package:zinotalens/model/product_details_model.dart';
import 'package:zinotalens/utils/style.dart';

import '../utils/colors.dart';
import '../utils/images.dart';

class ProductViewPageWidget {
  final BuildContext context;

  ProductViewPageWidget(this.context);

  Widget ProductImageSliderAndDesc(
          {required String photo,
          required String title,
          double? rating,
          int? stockQuantity,
          String? frameSize,
          String? frameWidth,
          required int sellingPrice,
          int? listingPrice}) =>
      Container(
        decoration: contentContainerDecoration(),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            height: 340,
            decoration: BoxDecoration(
                image: DecorationImage(
                    scale: 1.5, image: AssetImage(image_placeholder))),
            child: Image.network(
              photo,
              
            ),
          ),
          Divider(thickness: 1.2, color: Colors.gray.withOpacity(0.1)),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "$title",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Black Full Rim Rectangle",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Frame Width: ${frameWidth}mm",
                        style: TextStyle(fontSize: 14, color: Colors.gray),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Frame Size: $frameSize",
                        style: TextStyle(fontSize: 14, color: Colors.gray),
                      ),
                      SizedBox(height: 5),
                      RichText(
                        textScaleFactor: 1.1,
                        text: TextSpan(
                            text: "₹$sellingPrice  ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                            children: [
                              TextSpan(
                                  text: "₹$listingPrice",
                                  style: TextStyle(
                                      color: Colors.gray,
                                      decoration: TextDecoration.lineThrough))
                            ]),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
                      decoration: BoxDecoration(
                          color: Colors.skyBlue,
                          borderRadius: BorderRadius.circular(3)),
                      child: Row(
                        children: [
                          Text("$rating",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14)),
                          SizedBox(width: 3),
                          Icon(Icons.star, color: Colors.white, size: 14)
                        ],
                      ),
                    ),
                    SizedBox(width: 3),
                    Text("($stockQuantity)")
                  ],
                )
              ],
            ),
          ),
        ]),
      );

  Widget DeliveryOptionsView({String? warrantyTime}) => Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.gray, blurRadius: 0.5, offset: Offset(0.5, 0.5))
        ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Check Delivery Options",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
            SizedBox(height: 15),
            //check pincode textfield
            Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.gray,
                        blurRadius: 0.5,
                        offset: Offset(0.5, 0.5))
                  ]),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      decoration: InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          hintText: "Check Pincode",
                          isDense: true,
                          prefixIcon: Icon(
                            Icons.location_on,
                            color: Colors.gray,
                            size: 25,
                          )),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 5),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "CHANGE",
                        style: TextStyle(
                            color: Colors.skyBlue, fontWeight: FontWeight.w700),
                      ),
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(
                            Colors.gray.withOpacity(0.2)),
                        shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 15),
            CommitmentsView(
                title: "Home Delivery",
                description: "Get your frame delivered at your doorsteps",
                icon: Icons.home),
            SizedBox(height: 5),
            Divider(
              color: Colors.gray.withOpacity(0.2),
              thickness: 1.5,
            ),
            SizedBox(height: 5),
            CommitmentsView(
                title: "Warranty",
                description: "$warrantyTime Manufacturer Warranty",
                icon: Icons.verified_user)
          ],
        ),
      );

  Widget CommitmentsView(
          {required String title,
          String? description,
          required IconData icon}) =>
      Container(
        child: Row(
          children: [
            IconWithRoundedBorder(icon: icon),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 2),
                Text(
                  "$description",
                  style: TextStyle(
                      color: Colors.gray, fontWeight: FontWeight.w400),
                )
              ],
            )
          ],
        ),
      );

  Widget IconWithRoundedBorder({required IconData icon}) => Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border:
                Border.all(color: Colors.gray.withOpacity(0.3), width: 1.5)),
        child: Icon(icon, color: Colors.gray),
      );

  Widget AboutProduct(
          {String? description,
          required String productId,
          String? frameStyle}) =>
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.gray, blurRadius: 0.5, offset: Offset(0.5, 0.5))
        ]),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "About the Product",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
              SizedBox(height: 5),
              Text(
                "$description",
                style: TextStyle(
                    height: 1.5,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              SizedBox(height: 5),
              Text(
                "Product ID: $productId \nStyle: $frameStyle",
                style: TextStyle(
                    height: 1.5,
                    color: Colors.gray,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
            ]),
      );

  Widget ProductSpecification({required Specifications specifications}) =>
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.gray, blurRadius: 0.5, offset: Offset(0.5, 0.5))
        ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Specification",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
            SizedBox(height: 10),
            Table(
              children: [
                tableRow(
                    column1_text: "Frame Width",
                    column2_text: "${specifications.width} mm"),
                tableRow(
                    column1_text: "Weight",
                    column2_text: "${specifications.weight} gm"),
                tableRow(
                    column1_text: "Material",
                    column2_text: "${specifications.material}"),
                tableRow(
                    column1_text: "Collection",
                    column2_text: "${specifications.collections}"),
                tableRow(
                    column1_text: "Height",
                    column2_text: "${specifications.height} mm"),
              ],
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  showBottomSlider(specifications);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                  overlayColor:
                      MaterialStateProperty.all(Colors.gray.withOpacity(0.2)),
                ),
                child: Text(
                  "SHOW MORE DETAILS",
                  style: TextStyle(
                      color: Colors.skyBlue,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
      );

  void showBottomSlider(Specifications spec) => showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        var decimalHeight = MediaQuery.of(this.context).viewPadding.top / 100;
        var calculatedHeight = (10 - decimalHeight) / 10;
        return DraggableScrollableSheet(
          initialChildSize: calculatedHeight,
          minChildSize: 0.7,
          maxChildSize: calculatedHeight,
          expand: false,
          builder: (context, scrollController) => Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              shadowColor: Colors.transparent,
              leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  splashRadius: 24,
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.close_rounded,
                    color: Colors.black,
                  )),
              title: Text(
                "Specification",
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: Container(
              decoration: BoxDecoration(color: Colors.white),
              child: ListView(
                padding: EdgeInsets.only(top: 5, bottom: 10),
                controller: scrollController,
                children: [
                  specificationsRow(key: "Model No", value: spec.modelNo),
                  specificationsRow(key: "Shape", value: spec.shape),
                  specificationsRow(key: "Size", value: spec.size),
                  specificationsRow(key: "Width", value: "${spec.width} mm"),
                  specificationsRow(key: "Height", value: "${spec.height} mm"),
                  specificationsRow(key: "Dimension", value: spec.dimensions),
                  specificationsRow(key: "Color", value: spec.color),
                  specificationsRow(key: "Weight", value: "${spec.weight} gm"),
                  specificationsRow(
                      key: "Weight group", value: spec.weightGroup),
                  specificationsRow(key: "Material", value: spec.material),
                  specificationsRow(
                      key: "frame material", value: spec.frameMaterial),
                  specificationsRow(
                      key: "temple material", value: spec.templeMaterial),
                  specificationsRow(
                      key: "prescription type", value: spec.prescriptionType),
                  specificationsRow(
                      key: "frame style 1", value: spec.frameStyle1),
                  specificationsRow(
                      key: "frame style 2", value: spec.frameStyle2),
                  specificationsRow(
                      key: "collections", value: spec.collections),
                  specificationsRow(key: "warranty", value: spec.warranty),
                  specificationsRow(key: "gender", value: spec.gender),
                  specificationsRow(key: "condition", value: spec.condition),
                  specificationsRow(
                      key: "temple color", value: spec.templeColor),
                ],
              ),
            ),
          ),
        );
      });

  Widget specificationsRow({required String? key, required String? value}) =>
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Text(
                        "$key",
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.gray),
                      )),
                  SizedBox(width: 10),
                  Expanded(
                      flex: 7,
                      child: Text(
                        "$value",
                        textAlign: TextAlign.start,
                      ))
                ],
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.gray.withOpacity(0.2),
            )
          ],
        ),
      );

  TableRow tableRow(
          {required String column1_text, required String column2_text}) =>
      TableRow(children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [Text(column1_text)]),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [Text(column2_text)]),
        ),
      ]);
}
