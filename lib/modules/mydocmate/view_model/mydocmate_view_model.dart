import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'mydocmate_view_model.g.dart';

class MydocmateViewModel = _MydocmateViewModel with _$MydocmateViewModel;

abstract class _MydocmateViewModel with Store {
  @observable
  bool switchValue = true;
  
  @observable
  String getDayFormat =  DateFormat.E().format(DateTime.now());
   
  @observable
  int stepSet = 2843;

  @observable
  double activitySet = 1.2;

  @observable
  int caloriesSet = 42;

  @action
  Future<void> setStepPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = stepsModel(
        steps: stepSet, activity: activitySet, calories: caloriesSet);
    prefs.setString('steps', json.encode(data));
    final getData = prefs.getString('steps') ?? '';
    print(getData);
    //  final getdata1 = json.decode(getData);
    //   print(getdata1['calories']);
  }
}

class stepsModel {
  int? steps;
  double? activity;
  int? calories;

  stepsModel({this.steps, this.activity, this.calories});

  stepsModel.fromJson(Map<String, dynamic> json) {
    steps = json['steps'];
    activity = json['Activity'];
    calories = json['calories'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['steps'] = this.steps;
    data['Activity'] = this.activity;
    data['calories'] = this.calories;
    return data;
  }
}
