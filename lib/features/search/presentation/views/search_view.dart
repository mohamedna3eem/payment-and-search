import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_now/features/favorites/presentation/views/widgets/favoirtes_view_body.dart';

import '../../../../core/utils/color_manger.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../home/presentation/views/home_view.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  static const routeName = 'SearchView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(48.sp),
      //   child: PharmaAppBar(
      //     title: 'Search',
      //   ),
      // ),
      body: FavoriteViewBody(),
    );
  }
}
