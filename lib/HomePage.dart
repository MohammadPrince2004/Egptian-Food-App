import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/Data.dart';

import 'package:project/HomePageDesign.dart';
import 'package:project/ModeModel.dart';
import 'package:project/MyDrawerDesign.dart';
import 'package:project/RequiredOrders.dart';
import 'package:project/SectionDesign.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Mode mode;
  HomePage({required this.mode});
  @override
  
  Widget build(BuildContext context) {
    // print("Home Updated");
    return ChangeNotifierProvider<ModeModel>.value(
      value: ModeModel(mode: mode),
      child: Selector<ModeModel, Mode>(
        builder: (context, mode, child) {
          print(mode);
          return SafeArea(
            child: Scaffold(
              key: _scaffoldKey,
              drawer: Drawer(
                backgroundColor: Colors.black12,
                child: MyDrawerDesign(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),

              backgroundColor: mode == Mode.light
                  ? Colors.orange.shade50
                  : Colors.deepOrange.shade50,
              body: Stack(
                children: [
                  // Column(children: []),
                  Center(
                    child: ListView(
                      children: [
                        SizedBox(height: 100.h),
                        Center(
                          child: GridView.builder(
                            itemCount: 10,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 30.w,
                                  mainAxisSpacing: 5.h,
                                  mainAxisExtent: 165.h,
                                ),
                            itemBuilder: (BuildContext context, int index) {
                              ApiData apiData=ApiData();
                              return SectionDesign(
                                index: index,
                                SectionImage: apiData.Data()[index]['section_image'],
                                sectionName: apiData.Data()[index]['section_name'],
                                mode: mode,
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 30.h),
                      ],
                    ),
                  ),
                  HomePageDesign(mode: mode),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                        icon: Icon(
                          Icons.menu,
                          size: 20.r,
                          color: mode == Mode.light
                              ? Colors.orange.shade50
                              : Colors.deepOrange.shade50,
                        ),
                      ),

                      Text(
                        "Our Sections",
                        style: TextStyle(
                          fontSize: 17.sp,
                          color: mode == Mode.light
                              ? Colors.orange.shade50
                              : Colors.deepOrange.shade50,
                        ),
                      ),
                      Expanded(child: SizedBox(width: 20.w), flex: 1),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return RequiredOrders();
                              },
                            ),
                          );
                        },

                        icon: Icon(
                          Icons.fact_check,
                          size: 20.r,

                          color: mode == Mode.light
                              ? Colors.orange.shade50
                              : Colors.deepOrange.shade50,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<ModeModel>().changeMode();
                        },

                        icon: Icon(
                          mode == Mode.light
                              ? Icons.light_mode
                              : Icons.dark_mode,
                          size: 20.r,

                          color: mode == Mode.light
                              ? Colors.orange.shade50
                              : Colors.deepOrange.shade50,
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Expanded(child: SizedBox(width: 20.w), flex: 1),
                    ],
                  ),
                  
                ],
              ),
            ),
          );
        },
        selector: (BuildContext, ModeModel) {
          return ModeModel.mode;
        },
      ),
    );
  }
  // void showAboutUs(BuildContext context) {
  //   Navigator.pop(context); 

  //   showModalBottomSheet(
  //     context: context,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
  //     ),
  //     builder: (context) => Container(
  //       padding: EdgeInsets.all(20),
  //       height: 250,
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             "About Us",
  //             style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
  //           ),
  //           Divider(),
  //           SizedBox(height: 10),
  //           Text(
  //             "We are a team of developers building awesome apps using Flutter. "
  //             "This is a simple About Us section shown in a bottom sheet.",
  //             style: TextStyle(fontSize: 16),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
