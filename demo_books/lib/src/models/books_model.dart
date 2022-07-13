// To parse this JSON data, do
//
//     final booksModel = booksModelFromJson(jsonString);

import 'dart:convert';

List<BooksModel> booksModelFromJson(String str) => List<BooksModel>.from(json.decode(str).map((x) => BooksModel.fromJson(x)));

// String booksModelToJson(List<BooksModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BooksModel {

  final String? key;
  final String? title;
  final int? editionCount;
  final int? firstPublishYear;
  final int? numberOfPagesMedian;
  final List<String>? firstSentence;

  BooksModel({
    this.key,
    this.title,
    this.editionCount,
    this.firstPublishYear,
    this.numberOfPagesMedian,
    this.firstSentence,
  });

  factory BooksModel.fromJson(Map<String, dynamic> json) => BooksModel(
      key                : ( json["key"] == null ) ? 'key' : json["key"],
      title              : ( json["title"] == null ) ? 'title' : json["title"],
      editionCount       : ( json["edition_count"] == null ) ? 0 : json["edition_count"],
      firstPublishYear   : ( json["first_publish_year"] == null ) ? 2022 : json["first_publish_year"],
      numberOfPagesMedian: ( json["number_of_pages_median"] == null ) ? 2022 : json["number_of_pages_median"],
      firstSentence      : ( json["first_sentence"] == null ) ? [] : List<String>.from(json["first_sentence"].map((x) => x)),
  );

  // Map<String, dynamic> toJson() => {
  //   "key": key == null ? null : key,
  //   "title": title == null ? null : title,
  //   "edition_count": editionCount == null ? null : editionCount,
  //   "first_publish_year": firstPublishYear == null ? null : firstPublishYear,
  //   "number_of_pages_median": numberOfPagesMedian == null ? null : numberOfPagesMedian,
  //   "first_sentence": firstSentence == null ? null : List<dynamic>.from(firstSentence.map((x) => x)),
  // };

}
