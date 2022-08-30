import 'package:flutter/material.dart' hide Colors;
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:zinotalens/model/card_model.dart';
import 'package:zinotalens/provider/product_cart_provider.dart';
import 'package:zinotalens/utils/style.dart';
import 'package:zinotalens/widgets/custom_appbar.dart';

import '../utils/colors.dart';

class PaymentPage extends StatefulWidget {
  PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController cardController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController cvcController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<ProductCartProvider>(context);
    return Scaffold(
      backgroundColor: Colors.backgroundColor,
      appBar: customAppBar(context, isCartIcon: false),
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(children: [
          Container(
            decoration: contentContainerDecoration(),
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 14),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  controller: cardController,
                  maxLines: 1,
                  maxLength: 16,
                  onChanged: (value) {
                    if (value.length == 16) FocusScope.of(context).nextFocus();
                  },
                  validator: (value) {
                    if (value!.isEmpty) return "card number is required";
                    return null;
                  },
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                      counterText: "",
                      isDense: true,
                      label: Text("Card Number")),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        maxLines: 1,
                        controller: monthController,
                        maxLength: 2,
                        onChanged: (value) {
                          if (value.length == 2)
                            FocusScope.of(context).nextFocus();
                        },
                        validator: (value) {
                          if (value!.isEmpty) return "required";
                          return null;
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                            counterText: "", isDense: true, label: Text("MM")),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        maxLines: 1,
                        controller: yearController,
                        maxLength: 2,
                        onChanged: (value) {
                          if (value.length == 2)
                            FocusScope.of(context).nextFocus();
                        },
                        validator: (value) {
                          if (value!.isEmpty) return "required";
                          return null;
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                            counterText: "", isDense: true, label: Text("YY")),
                      ),
                    ),
                    SizedBox(width: 40),
                    Expanded(
                      flex: 4,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        maxLines: 1,
                        controller: cvcController,
                        maxLength: 3,
                        validator: (value) {
                          if (value!.isEmpty) return "required";
                          return null;
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                            counterText: "", isDense: true, label: Text("CVC")),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 5),
          Container(
            decoration: contentContainerDecoration(),
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 14),
            child: Container(
                height: 45,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2))),
                        shadowColor:
                            MaterialStateProperty.all(Colors.transparent)),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        CardModel card = CardModel(
                            cardNumber: cardController.text.trim(),
                            expiryDate:
                                "${monthController.text.trim()}/${yearController.text.trim()}",
                            cvvCode: cvcController.text.trim());
                      }
                    },
                    child: Text("PAY ₹${cartProvider.getTotalPrice}"))),
          )
        ]),
      ),
    );
  }
}
