import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentController {
  late Razorpay razorpay;

  void openCheckout(int amount) async {
    amount = amount * 100;
    var options = {
      'key': 'rzp_test_usbspX5c2aDUgA',
      'amount': amount,
      'name': 'Favad',
      'prefill': {
        'contact': '1234567890',
        'email': 'test@gmail.com'
      },
      'external': {
        'wallets': [
          'paytm'
        ]
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }
}
