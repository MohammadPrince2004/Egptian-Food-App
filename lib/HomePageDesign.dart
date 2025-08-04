import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/ModeModel.dart';

// ignore: must_be_immutable
class HomePageDesign extends StatelessWidget {
  Mode mode;
  HomePageDesign({required this.mode});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        
        Positioned(
          top: -320.r,
          left: -70.r,

          child: Card(
            shape: CircleBorder(),
            color:mode==Mode.light?Colors.orange.shade50:Colors.black12,
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2,
                    color: mode == Mode.light
                        ? Colors.orange
                        : Colors.deepOrange.shade400,
                  ),
                ),
                child: CircleAvatar(
                  radius: 200.r,
                  backgroundColor: mode == Mode.light
                      ? Colors.orange
                      : Colors.deepOrange.shade400,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
