// To parse this JSON data, do
//
//     final detailBookModel = detailBookModelFromJson(jsonString);

import 'dart:convert';

DetailBookModel detailBookModelFromJson(String str) => DetailBookModel.fromJson(json.decode(str));

class DetailBookModel {
  final String? description;
  final String? title;
  final List<String>? subjects;
  final int? latestRevision;
  final Created? created;
  final LastModified? lastModified;

  DetailBookModel({
    this.description,
    this.title,
    this.subjects,
    this.latestRevision,
    this.created,
    this.lastModified,
  });

  factory DetailBookModel.fromJson(Map<String, dynamic> json) => DetailBookModel(
    description   : ( json["description"] == null ) ? 'description' : json["description"],
    title         : ( json["title"] == null ) ? 'title' : json["title"],
    subjects      : ( json["subjects"] == null ) ? [] : List<String>.from(json["subjects"].map((x) => x)),
    latestRevision: ( json["latest_revision"] == null ) ? 0 : json["latest_revision"],
    created       : ( json["created"] == null ) ? null : Created.fromJson(json["created"]),
    lastModified  : ( json["last_modified"] == null ) ? null : LastModified.fromJson(json["last_modified"]),
  );

}

class Created {
  
  final DateTime? value;

  Created({
    this.value,
  });

  factory Created.fromJson(Map<String, dynamic> json) => Created(
      value: (json["value"] == null) ? DateTime.now() : DateTime.parse(json["value"]),
  );
}

class LastModified {

  final DateTime? value;

  LastModified({
    this.value,
  });

  factory LastModified.fromJson(Map<String, dynamic> json) => LastModified(
    value: (json["value"] == null) ? DateTime.now() : DateTime.parse(json["value"]),
  );
}
