import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma_now/core/utils/app_images.dart';

import '../../../../../core/utils/color_manger.dart';
import '../../../../../core/utils/text_style.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Dummy classes to replace imported dependencies

class ProductsListViewItem extends StatelessWidget {
  final int index;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;

  const ProductsListViewItem({
    super.key,
    required this.index,
    required this.isFavorite,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 16.h,
        left: 16.r,
        right: 16.r,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 105.w,
            decoration: BoxDecoration(
              color: index.isEven
                  ? ColorManager.lightBlueColorF5C
                  : ColorManager.lightGreenColorF5C,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.r),
                  bottomLeft: Radius.circular(8.r)),
              border: Border.all(color: ColorManager.greyColorC6),
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      onError: (exception, stackTrace) =>
                          const Text('No image available'),
                      image: NetworkImage('https://via.placeholder.com/150'),
                    ),
                  ),
                  height: 122.h,
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: 8.h, right: 8.w),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        alignment:
                            Alignment.centerLeft, // Align text within the stack
                        children: [
                          // 1. The SVG Banner
                          SvgPicture.asset(
                            Assets.gold_banner,
                            height: 24,
                            width: 48,
                          ),

                          Padding(
                            padding: EdgeInsets.only(
                              top: 1.h,
                              left: 20.0.h,
                            ), // Adjust padding to position text
                            child: Text(
                              "50%", // <<< Your Text Here
                              style: TextStyle(
                                color:
                                    Colors.black, // Choose a contrasting color
                                fontSize: 9.sp, // Adjust font size
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          _buildRightContainer(),
        ],
      ),
    );
  }

  Widget _buildRightContainer() {
    return Container(
      width: 237.w,
      height: 124.h, // Increased height to prevent overflow
      decoration: BoxDecoration(
        color: ColorManager.buttom_info,
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(8.r), topRight: Radius.circular(8.r)),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 8.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 148.w,
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.r),
                    child: Text(
                      'Product Name',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.listView_product_name,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onFavoritePressed,
                  child: Padding(
                    padding: EdgeInsets.only(right: 8.r, top: 4.r),
                    child: SvgPicture.asset(
                      isFavorite ? Assets.fav : Assets.nFav,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              'Category',
              overflow: TextOverflow.ellipsis,
              style: TextStyles.listView_product_subInf,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 8.r),
                  child: Text('\$19.99',
                      style: TextStyles.listView_product_name
                          .copyWith(fontSize: 12.sp)),
                ),
                SvgPicture.asset(
                  Assets.cart,
                  width: 32,
                  height: 32,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
