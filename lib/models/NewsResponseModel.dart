import 'dart:convert';

import 'package:nev_news_with_mvvm/network/ApiStatus.dart';

class NewsResponseModel {
  NewsResponseModel({
    String? status,
    int? totalResults,
    List<Articles>? articles,
  }) {
    _status = status;
    _totalResults = totalResults;
    _articles = articles;
  }

  NewsResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _totalResults = json['totalResults'];
    if (json['articles'] != null) {
      _articles = [];
      json['articles'].forEach((v) {
        _articles?.add(Articles.fromJson(v));
      });
    }
  }

  String? _status;
  int? _totalResults;
  List<Articles>? _articles;

  NewsResponseModel copyWith({
    String? status,
    int? totalResults,
    List<Articles>? articles,
  }) =>
      NewsResponseModel(
        status: status ?? _status,
        totalResults: totalResults ?? _totalResults,
        articles: articles ?? _articles,
      );

  String? get status => _status;

  int? get totalResults => _totalResults;

  List<Articles>? get articles => _articles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['totalResults'] = _totalResults;
    if (_articles != null) {
      map['articles'] = _articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Articles {
  Articles({
    Source? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) {
    _source = source;
    _author = author;
    _title = title;
    _description = description;
    _url = url;
    _urlToImage = urlToImage;
    _publishedAt = publishedAt;
    _content = content;
  }

  Articles.fromJson(dynamic json) {
    if(json['source'] is String) {
       // String jsonData = json.encode(json['source']);
      _source = json['source'] != null ? Source.fromJson(jsonDecode(json['source'])) : null;

      // Map arguments = (json['source']) as Map;
     // _source =  json.decode(json['source']);
      // _source = json['source'] != null ? Source.fromJson("") : null;
    }else{
      _source = json['source'] != null ? Source.fromJson(json['source']) : null;
    }
    _author = json['author'];
    _title = json['title'];
    _description = json['description'];
    _url = json['url'];
    _urlToImage = json['urlToImage'];
    _publishedAt = json['publishedAt'];
    _content = json['content'];
  }

  Source? _source;
  String? _author;
  String? _title;
  String? _description;
  String? _url;
  String? _urlToImage;
  String? _publishedAt;
  String? _content;

  Articles copyWith({
    Source? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) =>
      Articles(
        source: source ?? _source,
        author: author ?? _author,
        title: title ?? _title,
        description: description ?? _description,
        url: url ?? _url,
        urlToImage: urlToImage ?? _urlToImage,
        publishedAt: publishedAt ?? _publishedAt,
        content: content ?? _content,
      );

  Source? get source => _source;

  String? get author => _author;

  String? get title => _title;

  String? get description => _description;

  String? get url => _url;

  String? get urlToImage => _urlToImage;

  String? get publishedAt => _publishedAt;

  String? get content => _content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_source != null) {
      map['source'] = json.encode(_source);
    }
    map['author'] = _author;
    map['title'] = _title;
    map['description'] = _description;
    map['url'] = _url;
    map['urlToImage'] = _urlToImage;
    map['publishedAt'] = _publishedAt;
    map['content'] = _content;
    return map;
  }
}

class Source {
  Source({
    dynamic? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  Source.fromJson(dynamic json) {

    _id = json['id'];
    _name = json['name'];
  }

  dynamic _id;
  String? _name;

  Source copyWith({
    dynamic id,
    String? name,
  }) =>
      Source(
        id: id ?? _id,
        name: name ?? _name,
      );

  dynamic get id => _id;

  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

  factory Source.fromMap(Map<String, dynamic> map) {
    return Source(
      id: map['id'],
      name: map['name'],
    );
  }

}
Map<String, dynamic> parseStringToMap(String input) {
  // Remove curly braces and split by commas
  List<String> keyValuePairs = input
      .replaceAll('{', '')
      .replaceAll('}', '')
      .split(',')
      .where((element) => element.isNotEmpty)
      .toList();

  // Create a map from the keyValuePairs
  Map<String, dynamic> resultMap = {};

  for (String pair in keyValuePairs) {
    List<String> keyValue = pair.split('=');
    if (keyValue.length == 2) {
      String key = keyValue[0].trim();
      String value = keyValue[1].trim();

      // Convert "null" strings to null values
      if (value == "null") {
        resultMap[key] = null;
      } else {
        resultMap[key] = value;
      }
    }
  }

  return resultMap;
}
