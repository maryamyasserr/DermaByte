class FreeTimeModel {
  DateTime? day;
  List<DateTime>? freeTime;

  FreeTimeModel({this.day, this.freeTime});

  factory FreeTimeModel.fromJson(Map<String, dynamic> json) => FreeTimeModel(
        day: json['day'] == null ? null : DateTime.parse(json['day'] as String),
        freeTime: (json['freeTime'] as List<dynamic>?)
            ?.map((e) => DateTime.parse(e as String))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'day': day?.toIso8601String(),
        'freeTime': freeTime?.map((e) => e.toIso8601String()).toList(),
      };
}
