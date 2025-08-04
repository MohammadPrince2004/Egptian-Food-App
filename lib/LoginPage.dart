import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:project/HomePage.dart';

import 'package:project/LoginPageDesign.dart';
import 'package:project/ModeModel.dart';

import 'package:provider/provider.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class LoginPage extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  GlobalKey<FormState> FormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Selector<ModeModel, Mode>(
      selector: (context, ModeModel) => ModeModel.mode,
      builder: (context, mode, child) => Scaffold(
        resizeToAvoidBottomInset: true,

        backgroundColor: context.read<ModeModel>().mode == Mode.light
            ? Colors.orange.shade200
            : Colors.deepOrange.shade600.withOpacity(.4),
        body: SafeArea(
          child: Stack(
            children: [
              LoginPageDesign(mode: context.read<ModeModel>().mode),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            context.read<ModeModel>().changeMode();
                          },
                          icon: Icon(
                            context.read<ModeModel>().mode == Mode.light
                                ? Icons.light_mode
                                : Icons.dark_mode,
                            color: Colors.orange.shade50,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 250.h),
                    Center(
                      child: Form(
                        key: FormKey,
                        autovalidateMode: AutovalidateMode.always,
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          color: context.read<ModeModel>().mode == Mode.light
                              ? Colors.orange.shade100.withOpacity(.7)
                              : Colors.deepOrange.shade100.withOpacity(.7),
                          child: SizedBox(
                            width: 325.w,
                            child: ListView(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 30.h,
                                  decoration: BoxDecoration(
                                    color:
                                        context.read<ModeModel>().mode ==
                                            Mode.light
                                        ? Colors.orange.withOpacity(.6)
                                        : Colors.deepOrange.withOpacity(.6),
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(30.r),
                                    ),
                                  ),
                                  child: Text(
                                    "Enter the number of table",
                                    style: TextStyle(
                                      color: Colors.orange.shade50,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                CircleAvatar(
                                  radius: 30.r,
                                  backgroundColor:
                                      context.read<ModeModel>().mode ==
                                          Mode.light
                                      ? Colors.orange
                                      : Colors.deepOrange.shade400,
                                  child: Icon(
                                    Icons.login,
                                    color: Colors.orange.shade50,
                                    size: 30.r,
                                  ),
                                ),
                                SizedBox(
                                  width: 200.w,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 20.h,
                                      horizontal: 40.w,
                                    ),
                                    child: TextFormField(
                                      controller: controller,
                                      validator: (value) {
                                        if (value!.length != 0) {
                                          if (num.parse(value).toInt() > 200 ||
                                              num.parse(value).toInt() <= 0) {
                                            return "Error , Enter Correct Number";
                                          }
                                        }
                                      },
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            20.r,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            20.r,
                                          ),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red.shade400,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            20.r,
                                          ),
                                        ),

                                        hint: Row(
                                          children: [
                                            Icon(
                                              Icons.table_bar,
                                              color: Colors.indigo.shade200,
                                            ),
                                            SizedBox(width: 5.w),
                                            Text(
                                              "Enter the Number of table",
                                              style: TextStyle(
                                                color: Colors.indigo.shade200,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 250.w,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 100,
                                    ),
                                    child: MaterialButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      minWidth: 250,
                                      splashColor:
                                          context.read<ModeModel>().mode ==
                                              Mode.light
                                          ? Colors.deepOrange
                                          : Colors.orange,
                                      color:
                                          context.read<ModeModel>().mode ==
                                              Mode.light
                                          ? Colors.orange
                                          : const Color.fromRGBO(
                                              255,
                                              112,
                                              67,
                                              1,
                                            ),
                                      onPressed: () {
                                        bool flag = true;
                                        if (controller.text == "") {
                                          flag = false;
                                        }
                                        if (FormKey.currentState!.validate() &&
                                            flag) {
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return HomePage(mode: mode);
                                              },
                                            ),
                                          );
                                        } else if (!flag) {
                                          SnackBar snackBar = SnackBar(
                                            backgroundColor: Colors.black87,
                                            content: Text(
                                              "Enter Any Number from 1 to 200 tables",
                                              style: TextStyle(
                                                color: Colors.red.shade400,
                                              ),
                                            ),
                                            action: SnackBarAction(
                                              label: "Close",
                                              onPressed: () {},
                                              textColor: Colors.red.shade300,
                                            ),
                                            duration: Duration(seconds: 1),
                                          );
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(snackBar);
                                        }
                                      },
                                      child: Text(
                                        "Enter",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          color: Colors.orange.shade50,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 7.h),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
