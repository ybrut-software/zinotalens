import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> createPaymentIntent(
    {required String amount}) async {
  Map<String, dynamic> reqMap = {
    'amount': amount,
    'currency': 'USD',
    'payment_method_types[]': 'card'
  };

  var response = await http.post(
          Uri.parse("https://api.stripe.com/v1/payment_intents"),
          body: reqMap,
          headers: {
            'Authorization':
                'Bearer sk_test_51LW3BZSBstzmOfTL8N9hZAoRsWMC8e9nqGcP8monpbNYUh1LGUqWbXErBEkG3Cx1Cm9NlS34fEffkZhUtgsg9Ght0074rB9VIc',
            'Content-Type': 'application/x-www-form-urlencoded'
          });

  // var body = jsonEncode(reqMap);
  // print(body);
  // var resJson = await ApiClient.getServices().paymentIntentApi(body);
  return jsonDecode(response.body);
}
