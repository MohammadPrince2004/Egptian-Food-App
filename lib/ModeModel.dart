import 'package:flutter/material.dart';


class ModeModel extends ChangeNotifier{
  static List<Map<String,dynamic>> required=[];
  // required dishes = {'name':'product name','amount':'...','price of dish':'...$'}
  static List<bool>? selected=List.generate(10, (i)=>false);
  bool state=false;
  Mode mode ;
  ModeModel({this.mode=Mode.light});
  void changeMode(){
    if (mode==Mode.light){
      mode=Mode.dark;
      
    }else{
      mode=Mode.light;
     
    } 
    notifyListeners();
  }
  void removeElement({required int index}){
    if (required.length!=0){
      state=!state;
      required.removeAt(index);
      print(required);
    }
    print(state);
    notifyListeners();
  }
    

}
enum Mode{
  light,
  dark
}