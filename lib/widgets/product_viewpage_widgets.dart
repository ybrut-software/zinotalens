import 'package:flutter/material.dart' hide Colors;
import 'package:zinotalens/widgets/values.dart';

import '../utils/colors.dart';

class ProductViewPageWidget {
  final BuildContext context;

  ProductViewPageWidget(this.context);

  Widget ProductImageSliderAndDesc(
          {required String photo,
          required String title,
          double? rating,
          int? stockQuantity,
          required int sellingPrice,
          int? listingPrice}) =>
      Container(
        decoration: contentContainerDecoration(),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            height: 340,
            child: Image.asset(
              photo,
              fit: BoxFit.cover,
            ),
          ),
          Divider(thickness: 1.2, color: Colors.gray.withOpacity(0.1)),
          Container(
            width: double.infinity,
            height: 130,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "$title",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Black Full Rim Rectangle",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Frame Width: 138mm",
                        style: TextStyle(fontSize: 14, color: Colors.gray),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Frame Size: Medium",
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 5),
                          decoration: BoxDecoration(
                              color: Colors.skyBlue,
                              borderRadius: BorderRadius.circular(3)),
                          child: Row(
                            children: [
                              Text("$rating",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14)),
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
                )
              ],
            ),
          ),
        ]),
      );

  Widget DeliveryOptionsView() => Container(
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
                description: "1 Year Manufacturer Warranty",
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

  Widget AboutProduct({String? description, required String productId}) =>
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
                "Product ID: $productId \nStyle: Standard",
                style: TextStyle(
                    height: 1.5,
                    color: Colors.gray,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
            ]),
      );

  Widget ProductSpecification() => Container(
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
                tableRow(column1_text: "Frame Width", column2_text: "134 mm"),
                tableRow(column1_text: "Weight", column2_text: "14 gm"),
                tableRow(
                    column1_text: "Material",
                    column2_text: "Ultem (Vintage Regular)"),
                tableRow(column1_text: "Collection", column2_text: "Air Flex"),
                tableRow(column1_text: "Height", column2_text: "35 mm"),
              ],
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  showBottomSlider();
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

  void showBottomSlider() => showModalBottomSheet(
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
              child: ListView.builder(
                padding: EdgeInsets.only(top: 5, bottom: 10),
                controller: scrollController,
                itemCount: 30,
                itemBuilder: (context, index) => Container(
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
                                  "Model No.",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(color: Colors.gray),
                                )),
                            Expanded(
                                flex: 7,
                                child: Text(
                                  "HP E10014L",
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
                ),
              ),
            ),
          ),
        );
      });

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
