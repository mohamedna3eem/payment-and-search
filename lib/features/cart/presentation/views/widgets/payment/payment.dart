import 'package:flutter/material.dart';
//   static const routeName = 'payment';

import 'package:flutter/material.dart';
import 'package:pharma_now/core/utils/color_manger.dart';
import 'package:pharma_now/core/widgets/Custom_buttom.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);
  static const routeName = 'payment';
  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int _selectedPaymentIndex = -1;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final width = mediaQuery.width;
    final height = mediaQuery.height;

    List<String> paymentMethods = ['PayPal', 'Apple Pay', 'Google Pay', 'MasterCard'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.primaryColor,
        centerTitle: true,
        title: Text("Select Payment Method"),),
      backgroundColor:ColorManager.grey50,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.03),

              SizedBox(height: height * 0.03),
              const Text(
                'Payment Option',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Select the payment method you want to use.',
                style: TextStyle(color: Colors.grey,fontSize: 15,
                fontWeight: FontWeight.bold),
              ),
              SizedBox(height: height * 0.03),


              Column(
                children: [
                  _paymentItem(title: '', index: 0, iconWidget: Image.asset("assets/images/Group.png"),
                      onTap: (selectedIndex) {
                        setState(() {
                          _selectedPaymentIndex = selectedIndex;
                        });}

                  ),
                  _paymentItem(title: '', index: 1, iconWidget: Image.asset("assets/images/apple.png"),
                     onTap: (selectedIndex) {
                        setState(() {
                    _selectedPaymentIndex = selectedIndex;
                    });}
                  ),
                  _paymentItem(title: '', index: 2, iconWidget: Image.asset("assets/images/google.png"),
                     onTap: (selectedIndex) {
                        setState(() {
                    _selectedPaymentIndex = selectedIndex;
                    });}
                  ) ,_paymentItem(title: '', index: 3, iconWidget: Image.asset("assets/images/mastercard.png"),
                     onTap: (selectedIndex) {
                        setState(() {
                    _selectedPaymentIndex = selectedIndex;
                    });}
                  )
                ],
              ),
              SizedBox(height: height * 0.02),

              CustomButton(text: "Add New One", onButtonClicked: (){},
              buttonColor: ColorManager.grey50,
                borderSide:   ColorManager.secondaryColor,
                 textStyle: TextStyle(color: ColorManager.secondaryColor,
                 fontSize: 24,
                   fontWeight: FontWeight.normal
                 ),
              ),
              SizedBox(height: height * 0.2),
              CustomButton(text: "Confirm", onButtonClicked: (){},
                buttonColor:ColorManager.secondaryColor ,
                  textStyle: TextStyle(
                    color: ColorManager.primaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.normal)
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _paymentItem({required String title,required int index,required Widget  iconWidget,
   required void Function(int)? onTap,
    }) {
    return GestureDetector(
    onTap: () {
    if (onTap != null) {
    onTap(index);
    } else {
    setState(() {
    _selectedPaymentIndex = index;
    });
    }},
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: ColorManager.primaryColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _selectedPaymentIndex == index ? ColorManager.secondaryColor : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              color: Colors.grey[300],
              child: iconWidget
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                '•••• •••• •••• 4679',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Icon(
              _selectedPaymentIndex == index
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off,
              color: _selectedPaymentIndex == index ? ColorManager.secondaryColor : Colors.grey,
            ),
          ],
        ),
      )
    );
  }
}
