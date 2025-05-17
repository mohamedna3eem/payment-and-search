import 'package:flutter/material.dart';
import 'package:pharma_now/core/utils/color_manger.dart';
import 'package:pharma_now/core/widgets/custom_text_field.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFF6D8BFE),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ColorManager.secondaryColor,
                  Color(0xFF4A64FE),
                  Color(0xFF6D8BFE),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Container(padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
            ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height:  MediaQuery.of(context).size.height * 0.05,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good day for shopping',
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.0001,),
                      Text(
                        'Taimoor Sikander',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ],)]
                  ),
                  SizedBox(height:  MediaQuery.of(context).size.height * 0.03,),
                  CustomTextFormField(
                     prefixIcon: Icon(Icons.search),
                    label: Text("Search in store"),
                  )
                ],
              ),
            ),),

          //
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



