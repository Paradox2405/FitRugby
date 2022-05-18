class WorkoutReport {
  int? id;
  String? date;
  String? time;
  String? calories;

  WorkoutReport({this.id, this.date, this.time, this.calories});

  WorkoutReport.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    time = json['time'];
    calories = json['calories'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['time'] = this.time;
    data['calories'] = this.calories;
    return data;
  }
}
