
//     final booksModel = booksModelFromJson(jsonString);

import 'dart:convert';

List<BooksModel> booksModelFromJson(String str) => List<BooksModel>.from(json.decode(str).map((x) => BooksModel.fromJson(x)));

class BooksModel {

  final String? key;
  final String? title;
  final int? editionCount;
  final int? firstPublishYear;
  final int? numberOfPagesMedian;
  final List<String>? contributor;
  final List<String>? firstSentence;
  final List<String>? language;
  final List<String>? authorName;

  BooksModel({
    this.key,
    this.title,
    this.editionCount,
    this.firstPublishYear,
    this.numberOfPagesMedian,
    this.contributor,
    this.firstSentence,
    this.language,
    this.authorName,
  });

  factory BooksModel.fromJson(Map<String, dynamic> json) => BooksModel(
    key                : ( json["key"] == null ) ? 'key' : json["key"],
    title              : ( json["title"] == null ) ? 'title' : json["title"],
    editionCount       : ( json["edition_count"] == null ) ? 0 : json["edition_count"],
    firstPublishYear   : ( json["first_publish_year"] == null ) ? 2022 : json["first_publish_year"],
    numberOfPagesMedian: ( json["number_of_pages_median"] == null ) ? 2022 : json["number_of_pages_median"],
    firstSentence      : ( json["first_sentence"] == null ) ? [] : List<String>.from(json["first_sentence"].map((x) => x)),
    contributor        : ( json["contributor"] == null ) ? [] : List<String>.from(json["contributor"].map((x) => x)),
    language           : ( json["language"] == null ) ? [] : List<String>.from(json["language"].map((x) => x)),
    authorName         : ( json["author_name"] == null ) ? [] : List<String>.from(json["author_name"].map((x) => x)),
  );

}
