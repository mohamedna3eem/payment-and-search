import 'package:flutter/material.dart';
//   static const routeName = 'payment';

import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);
  static const routeName = 'payment';
  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int _selectedPaymentIndex = -1; // لما يكون -1 يعني ولا واحد متحدد

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final width = mediaQuery.width;
    final height = mediaQuery.height;

    List<String> paymentMethods = ['PayPal', 'Apple Pay', 'Google Pay', 'MasterCard'];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.03),
              Row(
                children: [
                  const Icon(Icons.arrow_back),
                  const SizedBox(width: 8),
                  const Text(
                    'Select Payment Method',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: height * 0.03),
              const Text(
                'Payment Option',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Select the payment method you want to use.',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: height * 0.03),
              Expanded(
                child: ListView.builder(
                  itemCount: paymentMethods.length,
                  itemBuilder: (context, index) {
                    return _paymentItem(paymentMethods[index], index);
                  },
                ),
              ),
              SizedBox(height: height * 0.02),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(vertical: height * 0.02),
                  ),
                  onPressed: () {
                    // هنا تقدر تتحكم لما المستخدم يضغط Confirm
                    if (_selectedPaymentIndex != -1) {
                      print('Selected Payment: ${paymentMethods[_selectedPaymentIndex]}');
                    } else {
                      print('No payment method selected!');
                    }
                  },
                  child: const Text('Confirm', style: TextStyle(fontSize: 18)),
                ),
              ),
              SizedBox(height: height * 0.02),
            ],
          ),
        ),
      ),
    );
  }

  Widget _paymentItem(String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPaymentIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Color(0xFFF7F7F7),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _selectedPaymentIndex == index ? Colors.blue : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              color: Colors.grey[300],
              child: Icon(Icons.payment),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                '•••• •••• •••• 4679',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Icon(
              _selectedPaymentIndex == index
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off,
              color: _selectedPaymentIndex == index ? Colors.blue : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
