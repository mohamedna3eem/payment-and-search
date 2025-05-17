import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharma_now/core/utils/app_images.dart';
import 'package:pharma_now/features/home/presentation/views/widgets/category_widget.dart';
import 'package:pharma_now/features/home/presentation/views/widgets/new%20_products_list_view_item.dart';
import 'package:pharma_now/features/home/presentation/views/product_view.dart';
import 'package:pharma_now/features/home/presentation/views/widgets/section_widget.dart';
import 'package:pharma_now/features/home/presentation/views/widgets/offers_list_view_item.dart';
import 'package:pharma_now/features/new%20products/presentation/views/new_products_view.dart';
import 'package:pharma_now/features/offers/presentation/views/offers_view.dart';

import '../../../../../core/utils/button_style.dart';
import '../../../../../core/utils/color_manger.dart';
import '../../../../../core/utils/text_style.dart';
import '../../../../shopping by category/presentation/views/categories_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          ImageSlideshow(
          width: double.infinity,
          height: 150,
          initialPage: 0,
          indicatorColor: Colors .blue,
          indicatorBackgroundColor: Colors.grey,
          children: [
            Stack(
              children: [
                SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      Assets.home_bannner,
                      fit: BoxFit.fill,
                    )),
                Positioned(
                  top: 30,
                  left: 42,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Discount ',
                        style: TextStyles.bold24Black,
                      ),
                      Text(
                        '30%',
                        style: TextStyles.bold24Black
                            .copyWith(color: ColorManager.redColorF5),
                      ),
                      SizedBox(),
                      ElevatedButton(
                          style: ButtonStyles.smallButton,
                          onPressed: () {},
                          child: Text(
                            'Buy Now',
                            style: TextStyles.buttonLabel,
                          ))
                    ],
                  ),
                )
              ],
            ),
            Stack(
              children: [
                SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      Assets.home_bannner,
                      fit: BoxFit.fill,
                    )),
                Positioned(
                  top: 30,
                  left: 42,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Discount ',
                        style: TextStyles.bold24Black,
                      ),
                      Text(
                        '30%',
                        style: TextStyles.bold24Black
                            .copyWith(color: ColorManager.redColorF5),
                      ),
                      SizedBox(),
                      ElevatedButton(
                          style: ButtonStyles.smallButton,
                          onPressed: () {},
                          child: Text(
                            'Buy Now',
                            style: TextStyles.buttonLabel,
                          ))
                    ],
                  ),
                )
              ],
            ),
            Stack(
              children: [
                SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      Assets.home_bannner,
                      fit: BoxFit.fill,
                    )),
                Positioned(
                  top: 30,
                  left: 42,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Discount ',
                        style: TextStyles.bold24Black,
                      ),
                      Text(
                        '30%',
                        style: TextStyles.bold24Black
                            .copyWith(color: ColorManager.redColorF5),
                      ),
                      SizedBox(),
                      ElevatedButton(
                          style: ButtonStyles.smallButton,
                          onPressed: () {},
                          child: Text(
                            'Buy Now',
                            style: TextStyles.buttonLabel,
                          ))
                    ],
                  ),
                )
              ],
            ),
          ],
          onPageChanged: (value) {
            print('Page changed: $value');
          },
          autoPlayInterval: 3000,
          isLoop: true,
        ),



            SectionWidget(
              sectionTitle: 'Categories',
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, CategoriesView.routeName);
              },
            ),
            _buildCategoriesList(),
            SectionWidget(
              sectionTitle: 'Offers',
              onTap: () {
                Navigator.pushReplacementNamed(context, OffersView.routeName);
              },
            ),
            _buildOffersList(),
            SectionWidget(
              sectionTitle: 'New Products',
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, NewProductView.routeName);
              },
            ),
            _buildNewProductsList(),
            SizedBox(
              height: 48,
            )
          ],
        ),
      ),
    );
  }

  _buildCategoriesList() {
    return SizedBox(
      height: 110.h,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 5, // Replace with your actual item count
        itemBuilder: (context, index) => CategoryWidget(
            // Replace with your actual category data
            // You'll need to provide actual category data here
            ),
      ),
    );
  }

  _buildOffersList() {
    return SizedBox(
      height: 168.h,
      child: ListView.builder(
        itemCount: 5, // Replace with your actual item count
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => OffersListViewItem(
          index: index,
          isFavorite: true,
          onTap: () {
            Navigator.pushReplacementNamed(context, ProductView.routeName);
          },
          onFavoritePressed:
              () {}, // You'll need to provide actual product data here
        ),
      ),
    );
  }

  _buildNewProductsList() {
    return SizedBox(
      height: 188.h,
      child: ListView.builder(
        itemCount: 5, // Replace with your actual item count
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => NewProductsListViewItem(
          index: index,
          isFavorite: true,
          onFavoritePressed:
              () {}, // You'll need to provide actual product data here
        ),
      ),
    );
  }
}
