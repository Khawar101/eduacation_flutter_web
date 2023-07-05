// {
//     "courseKey": "",
//     "key": "",
//     "progress": 2.3,
//     "courseName":"",
//     "rating":4.3,
//     "startDate":"",
//     "endDate":"",
//     "userKey": "",
//     "lecture":[""]
// }

// ignore_for_file: prefer_collection_literals, unnecessary_this

class ReportModel {
  String? courseKey;
  String? key;
  double? progress;
  String? courseName;
  double? rating;
  dynamic startDate;
  dynamic endDate;
  String? userKey;
  List<String>? lecture;

  ReportModel(
      {this.courseKey,
      this.key,
      this.progress,
      this.courseName,
      this.rating,
      this.startDate,
      this.endDate,
      this.userKey,
      this.lecture});

  ReportModel.fromJson(Map<String, dynamic> json) {
    courseKey = json['courseKey'];
    key = json['key'];
    progress = json['progress'];
    courseName = json['courseName'];
    rating = json['rating'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    userKey = json['userKey'];
    lecture = json['lecture'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['courseKey'] = this.courseKey;
    data['key'] = this.key;
    data['progress'] = this.progress;
    data['courseName'] = this.courseName;
    data['rating'] = this.rating;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['userKey'] = this.userKey;
    data['lecture'] = this.lecture;
    return data;
  }
}
