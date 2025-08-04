import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/ModeModel.dart';
import 'package:provider/provider.dart';

class RequiredOrders extends StatelessWidget {
  int totPrice = 0;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ModeModel>.value(
      value: ModeModel(),
      child: Selector<ModeModel, bool>(
        selector: (context, ModeModel) => ModeModel.state,
        builder: (context, state, child) {
          print("Updated");
          return Scaffold(
            backgroundColor: Colors.orange.shade100,
            floatingActionButton: FloatingActionButton(
              shape: CircleBorder(),
              backgroundColor: Colors.orange,
              onPressed: () {
                showAboutUs(context);
              },
              child: Icon(Icons.account_balance_wallet_outlined),
            ),
            appBar: AppBar(
              foregroundColor: Colors.deepOrange.shade300,
              title: Text(
                "Required Oreders",
                style: TextStyle(
                  color: Colors.deepOrange.shade300,
                  fontSize: 17,
                ),
              ),
            ),
            body: ModeModel.required.length != 0
                ? ListView(
                    children: List.generate(
                      ModeModel.required.length,
                      (i) => Card(
                        elevation: 2,
                        child: SizedBox(
                          height: 80,
                          child: ListTile(
                            leading: Icon(Icons.local_dining_rounded),
                            title: Text(ModeModel.required[i]['name']),
                            subtitle: Text(
                              "Amount  :  ${ModeModel.required[i]['amount']}\nTot. Price Is ${ModeModel.required[i]['amount'] * ModeModel.required[i]['price']}",
                            ),
                            isThreeLine: true,

                            trailing: IconButton(
                              onPressed: () {
                                context.read<ModeModel>().removeElement(
                                  index: i,
                                );
                                getTotPrice();
                              },
                              icon: Icon(
                                Icons.delete,
                                size: 20.r,
                                color: Colors.red.shade400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: Text(
                      "No Products Required !!",
                      style: TextStyle(color: Colors.black38, fontSize: 15.sp),
                    ),
                  ),
          );
        },
      ),
    );
  }

  void showAboutUs(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        getTotPrice();
        return Container(
          padding: EdgeInsets.all(20),
          height: 150.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                " Your Fatora ",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Divider(),
              SizedBox(height: 10.h),
              Center(
                child: Text(
                  totPrice != 0
                      ? "The Total Price Is $totPrice"
                      : " No Orders Required , Try Our Products !!",

                  style: TextStyle(fontSize: 16),
                ),
              ),
              Expanded(child: SizedBox()),
              Text("${DateTime.now()}",style: TextStyle(color: Colors.black54),)
            ],
          ),
        );
      },
    );
  }

  void getTotPrice() {
    totPrice = 0;
    if (ModeModel.required.length != 0) {
      ModeModel.required.forEach((e) {
        totPrice = totPrice + (e['price'] as int) * (e['amount'] as int);
      });
    }
  }
}
