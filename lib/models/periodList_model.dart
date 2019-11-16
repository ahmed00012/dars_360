class PeriodListModel{
  String periodName;
  String startTime;
  String endTime;
  String subjectName;

  PeriodListModel.fromApi(data){
    this.periodName = data['periodName'];
    this.startTime = data['startTime'];
    this.endTime = data['endTime'];
    this.subjectName = data['subjectName'];
  }
}