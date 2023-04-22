// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);

import 'dart:convert';

Student studentFromJson(String str) => Student.fromJson(json.decode(str));

String studentToJson(Student data) => json.encode(data.toJson());

class Student {
  Student({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.admNo,
    required this.studentClass,
    required this.dob,
    required this.subjects,
    required this.parents,
    required this.bloodGroup,
    required this.image,
    required this.documents,
    required this.tuitionFee,
    required this.transportFee,
    required this.labFee,
    required this.v,
    required this.email,
    required this.notifications,
    required this.schoolName,
  });

  String id;
  String firstName;
  String lastName;
  String admNo;
  Class studentClass;
  DateTime dob;
  List<Subject> subjects;
  List<Parent> parents;
  String bloodGroup;
  Img image;
  List<dynamic> documents;
  int tuitionFee;
  int transportFee;
  int labFee;
  int v;
  String email;
  List<Notifis> notifications;
  String schoolName;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        admNo: json["admNo"],
        studentClass: Class.fromJson(json["class"]),
        dob: DateTime.parse(json["dob"]),
        subjects: List<Subject>.from(
            json["subjects"].map((x) => Subject.fromJson(x))),
        parents:
            List<Parent>.from(json["parents"].map((x) => Parent.fromJson(x))),
        bloodGroup: json["bloodGroup"],
        image: Img.fromJson(json["image"]),
        documents: List<dynamic>.from(json["documents"].map((x) => x)),
        tuitionFee: json["TuitionFee"],
        transportFee: json["TransportFee"],
        labFee: json["LabFee"],
        v: json["__v"],
        email: json["email"],
        notifications: List<Notifis>.from(
            json["notifications"].map((x) => Notifis.fromJson(x))),
        schoolName: json["schoolName"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "admNo": admNo,
        "class": studentClass.toJson(),
        "dob": dob.toIso8601String(),
        "subjects": List<dynamic>.from(subjects.map((x) => x.toJson())),
        "parents": List<dynamic>.from(parents.map((x) => x)),
        "bloodGroup": bloodGroup,
        "image": image.toJson(),
        "documents": List<dynamic>.from(documents.map((x) => x)),
        "TuitionFee": tuitionFee,
        "TransportFee": transportFee,
        "LabFee": labFee,
        "__v": v,
        "email": email,
        "notifications":
            List<dynamic>.from(notifications.map((x) => x.toJson())),
        "schoolName": schoolName,
      };
}

class Img {
  Img({
    required this.eTag,
    required this.location,
    required this.key,
    required this.bucket,
    this.imageKey,
  });

  String eTag;
  String location;
  String key;
  Bucket bucket;
  String? imageKey;

  factory Img.fromJson(Map<String, dynamic> json) => Img(
        eTag: json["ETag"],
        location: json["Location"],
        key: json["Key"],
        bucket: bucketValues.map[json["Bucket"]]!,
        imageKey: json["key"],
      );

  Map<String, dynamic> toJson() => {
        "ETag": eTag,
        "Location": location,
        "Key": key,
        "Bucket": bucketValues.reverse[bucket],
        "key": imageKey,
      };
}

enum Bucket { UNO_GUIDE_BUCKET_0 }

final bucketValues =
    EnumValues({"uno-guide-bucket-0": Bucket.UNO_GUIDE_BUCKET_0});

class Notifis {
  Notifis({
    required this.id,
    required this.receiver,
    required this.receiverId,
    required this.senderId,
    required this.title,
    required this.text,
    required this.active,
    required this.type,
    required this.v,
  });

  String id;
  String receiver;
  String receiverId;
  School senderId;
  String title;
  String text;
  bool active;
  List<String> type;
  int v;

  factory Notifis.fromJson(Map<String, dynamic> json) => Notifis(
        id: json["_id"],
        receiver: json["receiver"],
        receiverId: json["receiver_id"],
        senderId: schoolValues.map[json["sender_id"]]!,
        title: json["title"],
        text: json["text"],
        active: json["active"],
        type: List<String>.from(json["type"].map((x) => x)),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "receiver": receiver,
        "receiver_id": receiverId,
        "sender_id": schoolValues.reverse[senderId],
        "title": title,
        "text": text,
        "active": active,
        "type": List<dynamic>.from(type.map((x) => x)),
        "__v": v,
      };
}

enum School { THE_63275848690_AC78_EFD493_FCD }

final schoolValues = EnumValues(
    {"63275848690ac78efd493fcd": School.THE_63275848690_AC78_EFD493_FCD});

class Class {
  Class({
    required this.id,
    required this.grade,
    required this.div,
    required this.school,
    required this.v,
    required this.classTeacher,
  });

  String id;
  int grade;
  String div;
  School school;
  int v;
  String classTeacher;

  factory Class.fromJson(Map<String, dynamic> json) => Class(
        id: json["_id"],
        grade: json["grade"],
        div: json["div"],
        school: schoolValues.map[json["school"]]!,
        v: json["__v"],
        classTeacher: json["classTeacher"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "grade": grade,
        "div": div,
        "school": schoolValues.reverse[school],
        "__v": v,
        "classTeacher": classTeacher,
      };
}

class Subject {
  Subject({
    required this.qaStatus,
    required this.id,
    required this.student,
    required this.subject,
    required this.activityStatus,
    required this.recClassStatus,
    required this.animatedVideoStatus,
    required this.assignmentsStatus,
    required this.v,
    required this.gameStatus,
    required this.notesStatus,
  });

  List<dynamic> qaStatus;
  String id;
  String student;
  Subsubject subject;
  List<String> activityStatus;
  List<dynamic> recClassStatus;
  List<String> animatedVideoStatus;
  List<dynamic> assignmentsStatus;
  int v;
  List<String> gameStatus;
  List<String> notesStatus;

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        qaStatus: List<dynamic>.from(json["qaStatus"].map((x) => x)),
        id: json["_id"],
        student: json["student"],
        subject: Subsubject.fromJson(json["subject"]),
        activityStatus: List<String>.from(json["activityStatus"].map((x) => x)),
        recClassStatus:
            List<dynamic>.from(json["recClassStatus"].map((x) => x)),
        animatedVideoStatus:
            List<String>.from(json["animatedVideoStatus"].map((x) => x)),
        assignmentsStatus:
            List<dynamic>.from(json["assignmentsStatus"].map((x) => x)),
        v: json["__v"],
        gameStatus: List<String>.from(json["gameStatus"].map((x) => x)),
        notesStatus: List<String>.from(json["notesStatus"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "qaStatus": List<dynamic>.from(qaStatus.map((x) => x)),
        "_id": id,
        "student": student,
        "subject": subject.toJson(),
        "activityStatus": List<dynamic>.from(activityStatus.map((x) => x)),
        "recClassStatus": List<dynamic>.from(recClassStatus.map((x) => x)),
        "animatedVideoStatus":
            List<dynamic>.from(animatedVideoStatus.map((x) => x)),
        "assignmentsStatus":
            List<dynamic>.from(assignmentsStatus.map((x) => x)),
        "__v": v,
        "gameStatus": List<dynamic>.from(gameStatus.map((x) => x)),
        "notesStatus": List<dynamic>.from(notesStatus.map((x) => x)),
      };
}

class Subsubject {
  Subsubject({
    required this.id,
    required this.name,
    required this.grade,
    required this.school,
    required this.subSubjects,
    required this.image,
    required this.notes,
    required this.qa,
    required this.activity,
    required this.game,
    required this.recClass,
    required this.animatedVideo,
    required this.lessons,
    required this.assignments,
    required this.v,
    required this.public,
  });

  String id;
  String name;
  int grade;
  School school;
  List<Subsubject> subSubjects;
  Img image;
  List<Note> notes;
  List<Note> qa;
  List<Activity> activity;
  List<Game> game;
  List<Activity> recClass;
  List<Activity> animatedVideo;
  List<dynamic> lessons;
  List<dynamic> assignments;
  int v;
  bool public;

  factory Subsubject.fromJson(Map<String, dynamic> json) => Subsubject(
        id: json["_id"],
        name: json["name"],
        grade: json["grade"],
        school: schoolValues.map[json["school"]]!,
        subSubjects: List<Subsubject>.from(
            json["subSubjects"].map((x) => Subsubject.fromJson(x))),
        image: Img.fromJson(json["image"]),
        notes: List<Note>.from(json["notes"].map((x) => Note.fromJson(x))),
        qa: List<Note>.from(json["qa"].map((x) => Note.fromJson(x))),
        activity: List<Activity>.from(
            json["activity"].map((x) => Activity.fromJson(x))),
        game: List<Game>.from(json["game"].map((x) => Game.fromJson(x))),
        recClass: List<Activity>.from(
            json["recClass"].map((x) => Activity.fromJson(x))),
        animatedVideo: List<Activity>.from(
            json["animatedVideo"].map((x) => Activity.fromJson(x))),
        lessons: List<dynamic>.from(json["lessons"].map((x) => x)),
        assignments: List<dynamic>.from(json["assignments"].map((x) => x)),
        v: json["__v"],
        public: json["public"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "grade": grade,
        "school": schoolValues.reverse[school],
        "subSubjects": List<dynamic>.from(subSubjects.map((x) => x.toJson())),
        "image": image.toJson(),
        "notes": List<dynamic>.from(notes.map((x) => x.toJson())),
        "qa": List<dynamic>.from(qa.map((x) => x.toJson())),
        "activity": List<dynamic>.from(activity.map((x) => x.toJson())),
        "game": List<dynamic>.from(game.map((x) => x.toJson())),
        "recClass": List<dynamic>.from(recClass.map((x) => x.toJson())),
        "animatedVideo":
            List<dynamic>.from(animatedVideo.map((x) => x.toJson())),
        "lessons": List<dynamic>.from(lessons.map((x) => x)),
        "assignments": List<dynamic>.from(assignments.map((x) => x)),
        "__v": v,
        "public": public,
      };
}

class Activity {
  Activity({
    required this.name,
    required this.video,
    required this.image,
  });

  String name;
  String video;
  String image;

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        name: json["Name"],
        video: json["video"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "video": video,
        "image": image,
      };
}

class Game {
  Game({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Game.fromJson(Map<String, dynamic> json) => Game(
        name: json["Name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "url": url,
      };
}

class Note {
  Note({
    required this.name,
    required this.file,
  });

  String name;
  Img file;

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        name: json["name"],
        file: Img.fromJson(json["file"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "file": file.toJson(),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

class Parent {
  Parent({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.image,
    required this.email,
    required this.children,
    required this.notifications,
    required this.v,
  });

  String id;
  String firstName;
  String lastName;
  String image;
  String email;
  List<String> children;
  List<dynamic> notifications;
  int v;

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        image: json["image"],
        email: json["email"],
        children: List<String>.from(json["children"].map((x) => x)),
        notifications: List<dynamic>.from(json["notifications"].map((x) => x)),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "image": image,
        "email": email,
        "children": List<dynamic>.from(children.map((x) => x)),
        "notifications": List<dynamic>.from(notifications.map((x) => x)),
        "__v": v,
      };
}
