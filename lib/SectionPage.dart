import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/Data.dart';

import 'package:project/ProductDesign.dart';
import 'package:project/SectionPageDesign.dart';

// ignore: must_be_immutable
class SectionPage extends StatelessWidget {
  int index;
  String sectionName;
  SectionPage({required this.sectionName, required this.index}) {
    print(sectionName);
    print(index);
  }
  @override
  Widget build(BuildContext context) {
    ApiData apiData=ApiData();
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
           
            PageView(
              children: List.generate(
                (apiData.Data()[index]['info_products'] as List).length,
                (i) {
                  print(apiData.Data()[index]['info_products'][i],);
                  print(apiData.Data()[index]['info_prices'][i],);
                  print(apiData.Data()[index]['info_images'][i],);

                  return ProductDesign(
                  productName: apiData.Data()[index]['info_products'][i],
                  image: apiData.Data()[index]['info_images'][i],
                  price: apiData.Data()[index]['info_prices'][i],
                );}
              ),
            ),
            SectionPageDesign(),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.white, size: 30.r),
                ),
                Text(
                  "$sectionName Section",
                  style: TextStyle(
                    color: Colors.orange.shade50,
                    fontSize: 17.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
