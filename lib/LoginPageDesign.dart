import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/ModeModel.dart';

class LoginPageDesign extends StatelessWidget {
  Mode mode;
  LoginPageDesign({this.mode = Mode.light});
  @override
  Widget build(BuildContext context) {
    print(mode);
    return  Stack(
        children: [
          Positioned(
            top: -200.r,
            left: -100.r,
            child: Card(
              color: mode == Mode.light ? Colors.white : Colors.black12,
              elevation: 2,
              shape: CircleBorder(),
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2,
                      color: mode == Mode.light
                          ? Colors.orange.shade400
                          : Colors.deepOrange.shade400,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 250.r,
                    backgroundImage: AssetImage("images/img2.webp"),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20.h,
            right: 10.w,
            child: Container(
              // padding: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // border: Border.all(width: 2, color: Colors.orange.shade400),
              ),
              child: Card(
                color: mode == Mode.light ? Colors.white : Colors.black12,
                elevation: 2,
                shape: CircleBorder(),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: CircleAvatar(
                    radius: 50.r,
                    backgroundImage: AssetImage("images/img1.jpg"),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 90.h,
            right: 95.w,
      
            child: Card(
              color: mode == Mode.light ? Colors.white : Colors.black12,
              shape: CircleBorder(),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  width: 15.w,
                  height: 15.h,
                  padding: EdgeInsets.all(2.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(
                      width: 2,
                      color: mode == Mode.light
                          ? Colors.orange.shade400
                          : Colors.deepOrange.shade300,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 120.h,
            right: 125.w,
            child: Container(
              width: 12.w,
              height: 12.h,
              padding: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  width: 2,
                  color: mode == Mode.light
                      ? Colors.orange.shade400
                      : Colors.deepOrange.shade300,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50.h,
            left: 100.w,
      
            child: Container(
              width: 30.w,
              height: 30.h,
              padding: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  width: 2,
                  color: mode == Mode.light
                      ? Colors.orange.shade400
                      : Colors.deepOrange.shade300,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 60.h,
            left: 10.w,
      
            child: Card(
              color: mode == Mode.light ? Colors.white : Colors.black12,
              shape: CircleBorder(),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  padding: EdgeInsets.all(2.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // borderRadius: BorderRadius.circular(50.r),
                    border: Border.all(
                      width: 2,
                      color: mode == Mode.light
                          ? Colors.orange.shade500
                          : Colors.deepOrange.shade400,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 50.r,
                    backgroundColor: mode == Mode.light
                        ? Colors.orange.shade500
                        : Colors.deepOrange.shade400,
                    child: Icon(
                      Icons.local_dining_outlined,
                      color: Colors.orange.shade100,
                      size: 50.r,
                    ),
                    // backgroundImage: AssetImage("images/img1.jpg"),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    
  }
}
