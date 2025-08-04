import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/CounterModel.dart';
import 'package:project/ModeModel.dart';
import 'package:provider/provider.dart';

class ProductDesign extends StatelessWidget {
  int counter = 0;
  String productName;
  int price;
  String image;
  ProductDesign({
    required this.price,
    required this.productName,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    print(productName);
    print(price);
    print(image);

    return ChangeNotifierProvider<CounterModel>.value(
      value: CounterModel(),
      child: Selector<CounterModel, int>(
        selector: (context, CounterModel) => CounterModel.counter,
        builder: (context, counter, child) {
          return Container(
            alignment: Alignment.bottomCenter,
            width: double.infinity,
            height: 667.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage("$image"),
              ),
            ),
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30.r),
                    ),
                  ),
                  height: 200.h,
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Amount",
                        style: TextStyle(color: Colors.indigo, fontSize: 15.sp),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.black12,
                            child: IconButton(
                              onPressed: () {
                                context.read<CounterModel>().Decreament();
                              },
                              icon: Icon(Icons.exposure_neg_1, size: 20.r),
                            ),
                          ),
                          SizedBox(width: 25.w),
                          Text("$counter"),
                          SizedBox(width: 25.w),
                          CircleAvatar(
                            backgroundColor: Colors.orange,
                            child: IconButton(
                              onPressed: () {
                                context.read<CounterModel>().Increament();
                              },
                              icon: Icon(Icons.plus_one, size: 20.r),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),

                      ElevatedButton(
                        onPressed: () {
                          bool added = false;
                          int? index;
                          for (Map<String, dynamic> e in ModeModel.required) {
                            if (e['name'] == productName) {
                              index = ModeModel.required.indexOf(e);
                              added = true;
                            }
                          }
                          if (counter != 0) {
                            if (!added) {
                              ModeModel.required.add({
                                'name': '$productName',
                                'price': price,
                                'amount': counter,
                              });
                            } else {
                              ModeModel.required[index!]['amount'] =
                                  ModeModel.required[index!]['amount'] +
                                  counter;
                            }
                          }
                          print(ModeModel.required);
                        },
                        child: Text(
                          "Submit",
                          style: TextStyle(color: Colors.orange),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 50.h,
                  child: Container(
                    alignment: Alignment.center,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(15.r),
                      ),
                      color: Colors.amber,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 150.r,
                          spreadRadius: .1.r,
                        ),
                      ],
                    ),

                    height: 40.h,
                    width: 125.w,
                    child: Text(
                      "$productName",
                      style: TextStyle(fontSize: 17.spMin, color: Colors.white),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 100.h,
                  child: Container(
                    alignment: Alignment.center,
                  
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(15.r),
                      ),
                      color: Colors.amber,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 150.r,
                          spreadRadius: .1.r,
                        ),
                      ],
                    ),
                  
                    height: 40.h,
                    width: 70.w,
                    child: Text(
                      "$price \$",
                      style: TextStyle(fontSize: 17.spMin, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
