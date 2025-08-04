import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier{
  int counter=0;
  void Increament(){
    counter++;
    notifyListeners();
  } 
  void Decreament(){
    if (counter!=0){
      counter--;
      notifyListeners();
    }
  }
}