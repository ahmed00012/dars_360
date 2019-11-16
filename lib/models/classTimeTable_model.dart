import 'package:dars_360/models/periodList_model.dart';

class ClassTimeTableModel{
  String dayName;
  List<PeriodListModel> periodList = new List<PeriodListModel>();

  ClassTimeTableModel.fromApi(data){
    this.dayName = data['dayName'];
    data['periodList']?.forEach(
          (listData) => periodList.add(
            PeriodListModel.fromApi(listData),
      ),
    );
  }
}