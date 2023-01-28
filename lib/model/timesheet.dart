class TimesheetModel {
    String? instructor;
    String? livingRoom;
    DateTime? schedule;
    String? type;
    int? color;
    int? week;

    TimesheetModel({this.instructor, this.livingRoom, this.schedule, this.type, this.week, this.color});

    factory TimesheetModel.fromJson(Map<String, dynamic> json) {
        return TimesheetModel(
            instructor: json['instructor'], 
            livingRoom: json['living_room'],
            schedule: DateTime.parse(json['schedule']),
            type: json['type'],
            color: json['color'] != null ? int.parse("0x${json["color"]}") : null,
            week: json["week"],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['instructor'] = this.instructor;
        data['living_room'] = this.livingRoom;
        data['schedule'] = this.schedule;
        data['type'] = this.type;
        data['week'] = this.week;
        data['color'] = this.color;
        return data;
    }
}