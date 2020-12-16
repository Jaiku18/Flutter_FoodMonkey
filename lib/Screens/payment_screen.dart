import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

Razorpay _razorpay = Razorpay();

@override
void dispose() {
  print('Clear is also working');
  _razorpay.clear();
}

@override
void initState() {
  initState();
  _razorpay = Razorpay();
  _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
  _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
  _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
}

class paymentGateway extends StatefulWidget {
  @override
  _paymentGatewayState createState() => _paymentGatewayState();
}

class _paymentGatewayState extends State<paymentGateway> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

void _handlePaymentSuccess(PaymentSuccessResponse response) async {
  print('payment Success');
}

void _handlePaymentError(PaymentFailureResponse response) {
  SnackBar(
    content:
        Text("ERROR: " + response.code.toString() + " - " + response.message),
  );
}

void _handleExternalWallet(ExternalWalletResponse response) {
  SnackBar(
    content: Text("EXTERNAL_WALLET: " + response.walletName),
  );
}

openCheckout(double amount) {
  var values = {
    'key': 'rzp_test_DjO6yZMeYFoXzZ',
    'amount': amount * 100,
    'name': 'Food Check Out',
    'description': 'Please pay for the items',
    'prefill': {'contact': '7550####79', 'email': 'dragonMonkey@gmail.com'},
    'external': {
      'wallets': ['paytm']
    }
  };

  try {
    _razorpay.open(values);

    print('working fine without error');
    dispose();
  } catch (e) {
    debugPrint(e.toString());
  }
}
