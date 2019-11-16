class SchedualModel{
  String dayName;

  SchedualModel.fromAPI(va){
    this.dayName=va['dayName'];
  }

  @override
  String toString() {
    return "dayName: $dayName;
  }

}