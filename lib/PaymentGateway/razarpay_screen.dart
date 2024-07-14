import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazarpayScreen extends StatefulWidget {
  const RazarpayScreen();

  @override
  State<RazarpayScreen> createState() => _RazarpayScreen();
}

class _RazarpayScreen extends State<RazarpayScreen> {
  Razorpay razorpay = Razorpay();

  @override
  Widget build(BuildContext context) {
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    return Scaffold(
      appBar: AppBar(
        title: Text("RazarPay"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Center(
          child: OutlinedButton(
            onPressed: () {
              var options = {
                'key': 'rzp_test_GcZZFDPP0jHtC4',
                'amount': 100, //in paise 100 paisa = 1 rs
                'name': 'Supriya Gupta.',
                'description': ' T-Shirt',
                'prefill': {
                  'contact': '9599694764',
                  'email': 'supriyag75@gmail.com'
                }
              };

              razorpay.open(options);
            },
            child: Text("Pay using RazarPay"),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    try {
      razorpay.clear();
    } catch (e) {
      print("Exception $e");
    }
  }
}

void _handlePaymentSuccess(PaymentSuccessResponse response) {
  // Do something when payment succeeds
  print("Payment Response ::${response} ");
  print("Payment paymentId ::${response.paymentId} ");
  print("Payment signature ::${response.signature} ");
  print("Payment data ::${response.data} ");
  Fluttertoast.showToast(msg: "Payment Success"); //success@razarpay for testing upi
}

void _handlePaymentError(PaymentFailureResponse response) {
  // Do something when payment fails
  Fluttertoast.showToast(msg: "Payment Fail");
}

void _handleExternalWallet(ExternalWalletResponse response) {
  // Do something when an external wallet was selected
}

