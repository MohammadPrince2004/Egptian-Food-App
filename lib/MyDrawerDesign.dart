import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:project/PressedModel.dart';

import 'package:provider/provider.dart';

class MyDrawerDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PressedModel>.value(
      value: PressedModel(),
      child: Builder(
        builder: (context) {
          return Column(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.orange),
                accountName: Text(
                  "Egptian Food",
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                accountEmail: Text(
                  "EgptianFood@gmail.com (For Contact)",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.black12,
                  child: Icon(
                    Icons.dinner_dining_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
              MaterialButton(
                splashColor: Colors.orange.shade300,
                onPressed: () {
                  Navigator.pop(context);
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (context) => Container(
                      padding: EdgeInsets.all(20),
                      height: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "About Us",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Divider(),
                          SizedBox(height: 10),
                          Text(
                            "Our Resturant Is Specialized At Egyptian Food ,Try it With Us .To Ask Any Order Call Our HotLine",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  );
                  print("1");
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 5,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.info_outline, color: Colors.white),
                      SizedBox(width: 15.w),
                      Text("About Us", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
              MaterialButton(
                splashColor: Colors.orange.shade300,
                onPressed: () {
                  Navigator.pop(context);
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (context) => Container(
                      padding: EdgeInsets.all(20),
                      height: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "How To Contact Us?",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Divider(),
                          SizedBox(height: 10),
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(Icons.call, size: 16),
                                SizedBox(width: 10.w),
                                Text(
                                  "HotLine ........",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 45,
                                child: TextButton(
                                  child: Row(
                                    children: [
                                      Text(
                                        "Facebook",
                                        style: TextStyle(
                                          color: Colors.blue[800],
                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(
                                height: 45,
                                child: TextButton(
                                  child: Row(
                                    children: [
                                      Text(
                                        "Whatsapp",
                                        style: TextStyle(
                                          color: Colors.teal[400],
                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 5,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.contact_page_outlined, color: Colors.white),
                      SizedBox(width: 15.w),
                      Text("Contact Us", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),

              Expanded(child: SizedBox()),
              Text(
                "Programmed By Elprince",
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(height: 10.h),
            ],
          );
        },
      ),
    );
  }
}
