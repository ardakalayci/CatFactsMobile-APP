// To parse this JSON data, do
//
//     final randomFacts = randomFactsFromJson(jsonString);

import 'dart:convert';

RandomFacts randomFactsFromJson(String str) => RandomFacts.fromJson(json.decode(str));

String randomFactsToJson(RandomFacts data) => json.encode(data.toJson());

class RandomFacts {
  RandomFacts({
    this.used,
    this.source,
    this.type,
    this.deleted,
    this.id,
    this.user,
    this.text,
    this.v,
    this.updatedAt,
    this.createdAt,
    this.status,
  });

  bool used;
  String source;
  String type;
  bool deleted;
  String id;
  String user;
  String text;
  int v;
  DateTime updatedAt;
  DateTime createdAt;
  Status status;

  factory RandomFacts.fromJson(Map<String, dynamic> json) => RandomFacts(
    used: json["used"],
    source: json["source"],
    type: json["type"],
    deleted: json["deleted"],
    id: json["_id"],
    user: json["user"],
    text: json["text"],
    v: json["__v"],
    updatedAt: DateTime.parse(json["updatedAt"]),
    createdAt: DateTime.parse(json["createdAt"]),
    status: Status.fromJson(json["status"]),
  );

  Map<String, dynamic> toJson() => {
    "used": used,
    "source": source,
    "type": type,
    "deleted": deleted,
    "_id": id,
    "user": user,
    "text": text,
    "__v": v,
    "updatedAt": updatedAt.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
    "status": status.toJson(),
  };
}

class Status {
  Status({
    this.verified,
    this.sentCount,
  });

  bool verified;
  int sentCount;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    verified: json["verified"],
    sentCount: json["sentCount"],
  );

  Map<String, dynamic> toJson() => {
    "verified": verified,
    "sentCount": sentCount,
  };
}
