import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'mydocmate_view_model_history.g.dart';

class MydocmateViewModelHistory = _MydocmateViewModelHistory with _$MydocmateViewModelHistory;

abstract class _MydocmateViewModelHistory with Store {
  @observable
  int dateSelect = DateTime.now().day;

  @observable
  String getDayFormat =  DateFormat.E().format(DateTime.now());

  @observable
  int stepSet = 100;

}