import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_now/core/utils/color_manger.dart';
import 'package:pharma_now/core/utils/text_style.dart';

// AppBar buildAppBar({
//   required String title,
//   String? assetName,
// }) {
//   return AppBar(
//     leading: assetName != null
//         ? IconButton(
//             icon: SvgPicture.asset(assetName),
//             onPressed: () {},
//           )
//         : null,
//     title: Text(
//       title,
//       style: TextStyles.Medium18,
//     ),
//     centerTitle: true,
//     elevation: 0,
//     bottom: PreferredSize(
//       preferredSize: const Size.fromHeight(1.0),
//       child: Container(
//         color: Color(0xFFF2F4F9),
//         height: 1,
//       ),
//     ),
//   );
// }

class PharmaAppBar extends StatelessWidget {
  const PharmaAppBar({super.key, required this.title, this.isBack = false});
  final String title;
  final bool isBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: isBack,
      backgroundColor: ColorManager.primaryColor,
      centerTitle: true,
      title: Text(title),
      titleTextStyle: TextStyles.appBarTitle18,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: Color(0xFFF2F4F9),
          height: 1,
        ),
      ),
    );
  }
}
