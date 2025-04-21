import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_now/features/new%20products/presentation/views/widgets/new_products_list_view_item.dart';

class NewProductViewBody extends StatelessWidget {
  const NewProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Expanded(child: _buildNewProductsList())],
    );
  }

  _buildNewProductsList() {
    return SizedBox(
      height: 188.h,
      child: ListView.builder(
        itemCount: 5, // Replace with your actual item count
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => ProductsListViewItem(
          index: index,
          isFavorite: true,
          onFavoritePressed:
              () {}, // You'll need to provide actual product data here
        ),
      ),
    );
  }
}
