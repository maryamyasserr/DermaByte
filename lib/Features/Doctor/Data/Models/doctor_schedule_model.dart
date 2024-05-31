class DoctorScheduleModel {
  String? id;
  DateTime? day;
  DateTime? startTime;
  DateTime? endTime;
  String? sessionTime;
  String? sessionCost;
  String? dermatologist;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? dayName;

  DoctorScheduleModel({
    this.id,
    this.day,
    this.startTime,
    this.endTime,
    this.sessionTime,
    this.sessionCost,
    this.dermatologist,
    this.createdAt,
    this.updatedAt,
    this.dayName,
  });

  factory DoctorScheduleModel.fromJson(Map<String, dynamic> json) {
    return DoctorScheduleModel(
      day: json['day'] == null ? null : DateTime.parse(json['day'] as String),
      startTime: json['startTime'] == null
          ? null
          : DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
      sessionTime: json['sessionTime'] as String?,
      sessionCost: json['sessionCost'] as String?,
      dermatologist: json['dermatologist'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      dayName: json['dayName'] as String?,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'day': day?.toIso8601String(),
        'startTime': startTime?.toIso8601String(),
        'endTime': endTime?.toIso8601String(),
        'sessionTime': sessionTime,
        'sessionCost': sessionCost,
        'dermatologist': dermatologist,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'dayName': dayName,
        'id': id,
      };
}
