import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:project/ModeModel.dart';
import 'package:project/SectionPage.dart';
import 'package:project/PressedModel.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SectionDesign extends StatelessWidget {
  String SectionImage;
  Mode mode;
  int index;
  String sectionName;
  SectionDesign({
    required this.SectionImage,
    required this.sectionName,
    required this.mode,
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PressedModel>.value(
      value: PressedModel(),
      child: Consumer<PressedModel>(
        builder: (context, PressedModel, child) {
          
          // print("Section updated");
          // print(PressedModel.btList);
          return Padding(
            padding: EdgeInsets.all(5.w),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Material(
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),

                    child: InkWell(
                      borderRadius: BorderRadius.circular(35.r),
                      splashColor: mode == Mode.light
                          ? Colors.orange.shade300
                          : Colors.deepOrange.shade300,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return SectionPage(sectionName: sectionName,index: index,);
                            },
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.all(5.r),
                        alignment: Alignment.bottomCenter,
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          color: Colors.orange,
                          image: DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: AssetImage(SectionImage),
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: 30.h,
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(30.r),
                            ),
                          ),
                          child: Text(
                            sectionName,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 20.r,
                  backgroundColor: mode == Mode.light
                      ? Colors.orange.shade200
                      : Colors.deepOrange.shade200,
                  child: IconButton(
                    onPressed: () {
                      PressedModel.pressedFunction(index);
                      SnackBar added_removed = SnackBar(
                        action: SnackBarAction(label: "Close", onPressed: (){}),
                        backgroundColor: Colors.black54.withOpacity(.8),
                        content: Text(
                          ModeModel.selected![index]
                              ? "$sectionName is added to favourite"
                              : "$sectionName is removed from favourite",
                        ),
                        duration: Duration(seconds: 1),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(added_removed);
                    },
                    icon: Icon(
                      ModeModel.selected![index]
                          ? Icons.favorite
                          : Icons.favorite_border,
                      size: 20.r,
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
