import 'package:razorpay_flutter/razorpay_flutter.dart';

void openPaymentCheckOut({required Razorpay razorpay, required int amount}){

  var options = {
      'key': 'rzp_test_6kXS2x1Kl05men',
      'amount': amount*100, //in the smallest currency sub-unit.
      'name': "Products",
      //'order_id': 'order_EMBFqjDHEEn80l', // Generate order_id using Orders API
      //'description': 'Fine T-Shirt',
      'timeout': 120, // in seconds
      'prefill': {'contact': '', 'email': ''}
    };

    try {
      razorpay.open(options);
    } catch (e) {
      print("PAYMENT Error 125 : $e");
    }
}