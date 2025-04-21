import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_now/features/offers/presentation/views/widgets/info_offers_list_view_item.dart';

class OffersViewBody extends StatelessWidget {
  const OffersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: _buildOffersList()),
        // SizedBox(
        //   height: 12,
        // )
      ],
    );
  }

  _buildOffersList() {
    return SizedBox(
      height: 168.h,
      child: ListView.builder(
        itemCount: 8, // Replace with your actual item count
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => InfoOffersListViewItem(
          index: index,
          isFavorite: true,
          onFavoritePressed:
              () {}, // You'll need to provide actual product data here
        ),
      ),
    );
  }
}
