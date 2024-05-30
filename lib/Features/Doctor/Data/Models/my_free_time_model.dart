class MyFreeTimeModel {
  DateTime? day;
  List<DateTime>? freeTime;
  int? numOfReservedSessions;

  MyFreeTimeModel({this.day, this.freeTime, this.numOfReservedSessions});

  factory MyFreeTimeModel.fromJson(Map<String, dynamic> json) {
    return MyFreeTimeModel(
      day: json['day'] == null ? null : DateTime.parse(json['day'] as String),
      freeTime: (json['freeTime'] as List<dynamic>?)
          ?.map((e) => DateTime.parse(e as String))
          .toList(),
      numOfReservedSessions: json['numOfReservedSessions'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'day': day?.toIso8601String(),
        'freeTime': freeTime?.map((e) => e.toIso8601String()).toList(),
        'numOfReservedSessions': numOfReservedSessions,
      };
}
