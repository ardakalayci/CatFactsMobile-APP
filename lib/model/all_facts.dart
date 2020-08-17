// To parse this JSON data, do
//
//     final allFacts = allFactsFromJson(jsonString);

import 'dart:convert';

AllFacts allFactsFromJson(String str) => AllFacts.fromJson(json.decode(str));

String allFactsToJson(AllFacts data) => json.encode(data.toJson());

class AllFacts {
  AllFacts({
    this.all,
  });

  List<All> all;

  factory AllFacts.fromJson(Map<String, dynamic> json) => AllFacts(
    all: List<All>.from(json["all"].map((x) => All.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "all": List<dynamic>.from(all.map((x) => x.toJson())),
  };
}

class All {
  All({
    this.id,
    this.text,
    this.type,
    this.user,
    this.upvotes,
    this.userUpvoted,
  });

  String id;
  String text;
  Type type;
  User user;
  int upvotes;
  dynamic userUpvoted;

  factory All.fromJson(Map<String, dynamic> json) => All(
    id: json["_id"],
    text: json["text"],
    type: typeValues.map[json["type"]],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    upvotes: json["upvotes"],
    userUpvoted: json["userUpvoted"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "text": text,
    "type": typeValues.reverse[type],
    "user": user == null ? null : user.toJson(),
    "upvotes": upvotes,
    "userUpvoted": userUpvoted,
  };
}

enum Type { CAT }

final typeValues = EnumValues({
  "cat": Type.CAT
});

class User {
  User({
    this.id,
    this.name,
  });

  String id;
  Name name;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    name: Name.fromJson(json["name"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name.toJson(),
  };
}

class Name {
  Name({
    this.first,
    this.last,
  });

  String first;
  String last;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    first: json["first"],
    last: json["last"],
  );

  Map<String, dynamic> toJson() => {
    "first": first,
    "last": last,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
