import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:zinotalens/services/payment_service.dart';
import 'package:zinotalens/model/card_model.dart';
import 'package:zinotalens/widgets/error_widgets.dart';

class PaymentProvider extends ChangeNotifier {
  int _isSelected = 0;

  int get getIsSelected => _isSelected;
  void setIsSelected(int index) {
    _isSelected = index;
    notifyListeners();
  }

  void makePaymentProvider(
      {required String amount, required BuildContext context}) async {
    // try {
      final billingDetails = BillingDetails(
        email: 'email@stripe.com',
        phone: '8319312145',
        address: Address(
          city: 'Chirimiri',
          country: 'IN',
          line1: '1459  Circle Drive',
          line2: '',
          state: 'Texas',
          postalCode: '497557',
        ),
      );
      var stripePaymentMethod = await Stripe.instance.createPaymentMethod(
          PaymentMethodParams.card(
              paymentMethodData:
                  PaymentMethodData(billingDetails: billingDetails)));

      var stripePaymentIntent = await createPaymentIntent(amount: amount);
      var response = await Stripe.instance.confirmPayment(
          stripePaymentIntent['client_secret'],
          PaymentMethodParams.cardFromMethodId(
              paymentMethodData: PaymentMethodDataCardFromMethod(
                  paymentMethodId: stripePaymentMethod.id)));

      if (response.status == "succeeded") {
        print("payment successful");
      }
      //test
      if (response.status == "requires_action") {
        print("payment successful");
        showSnackBarMessage(context, "payment successful");
        Navigator.pop(context);
      }
    // } catch (e) {
    //   print("error no PAY129 : $e");
    // }
  }
}
