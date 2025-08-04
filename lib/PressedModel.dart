import 'package:flutter/material.dart';
import 'package:project/ModeModel.dart';


class PressedModel extends ChangeNotifier {
 
  List<bool> btList=List.generate(10, (i)=>false);
  void pressedFunction(int index){

    btList[index]=!btList[index]; 
    ModeModel.selected![index]=!ModeModel.selected![index];
    print(btList);
    notifyListeners();
  }
  void resetDefault(){
    ModeModel.required=[];
    ModeModel.selected=List.generate(10, (i)=>false);
    btList=List.generate(10, (i)=>false);
    notifyListeners();

  }
  
}

