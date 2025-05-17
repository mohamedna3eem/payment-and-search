import 'package:flutter/material.dart';
import 'package:pharma_now/core/utils/color_manger.dart';
import 'package:pharma_now/features/cart/presentation/views/widgets/payment/payment.dart';

import '../../../../../core/widgets/Custom_buttom.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15
      ),
      decoration: BoxDecoration(
        color: ColorManager.grey50,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 0.03*height,),
        Text('All Products',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
          SizedBox(height: 0.03*height,),
          _buildCartItem(
            title: 'Fuel Injector Connector',
            subtitle: '75 MI',
            price: 8000,
            quantity: 1,
          ),
          const SizedBox(height: 10),
          _buildCartItem(
            title: 'Spark Plug',
            subtitle: '150 MI',
            price: 10000,
            quantity: 2,
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(height: 55,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorManager.primaryColor
            ),
              child: Row(
                children: [
                  const Icon(Icons.card_giftcard_outlined),
                  const SizedBox(width: 8),
                  const Expanded(child: Text('Promo Code')),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Apply'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          _buildSummaryRow('Subtotal', 8000),
          _buildSummaryRow('Discount', -1000),
          _buildSummaryRow('Delivery', 2000),
          const Divider(height: 32),
          _buildSummaryRow('Total', 9000, isTotal: true),
          SizedBox(height: height*0.1,),
          CustomButton(text: 'Continue', onButtonClicked: (){
            Navigator.of(context).pushNamed(PaymentPage.routeName);
          },
            buttonColor:ColorManager.secondaryColor ,
          textStyle: TextStyle(color: ColorManager.primaryColor,fontSize: 20),)
        ],
      ),
    );

  }
}
Widget _buildCartItem({
  required String title,
  required String subtitle,
  required int price,
  required int quantity,
}) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: ColorManager.primaryColor,
      border: Border.all(color: Colors.grey.shade300),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        Container(
          width: 70,
          height: 85,

          child: Image.asset("assets/images/image.png"),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 15)),
              const SizedBox(height: 4),
              Text(subtitle, style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 4),
              Text('$price LE', style: const TextStyle(color:ColorManager.secondaryColor,fontSize: 18,fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Container(decoration: BoxDecoration(
          color: ColorManager.grey50,
          borderRadius: BorderRadius.all(
            Radius.circular(50)
          )
        ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.remove,
                color: ColorManager.blackColor,
                ),
                color: ColorManager.primaryColor,
                autofocus: true,
                disabledColor: ColorManager.secondaryColor,
                focusColor: ColorManager.secondaryColor,
              ),
              Text(quantity.toString()),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add_circle_outlined,color: ColorManager.secondaryColor ,
                size: 30,
                ),


              ),
            ],
          ),
        )
      ],
    ),

  );
}

Widget _buildSummaryRow(String label, int amount, {bool isTotal = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            fontSize: isTotal ? 18 : 14,
          ),
        ),
        Text(
          '${amount} LE',
          style: TextStyle(
            color: isTotal ? ColorManager.secondaryColor : Colors.black,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            fontSize: isTotal ? 18 : 14,
          ),
        ),
      ],
    ),
  );
}
