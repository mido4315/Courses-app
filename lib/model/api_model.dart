class APIModel {
  List<Results>? results;

  APIModel({this.results});

  APIModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? url;
  String? name;
  bool? isfree;
  String? time;
  String? description;
  String? type;
  String? imageUrl;
  String? category;
  String? language;
  String? learn;
  String? creators;
  String? timeExpired;
  int? discountPercent;
  int? usesReamaining;

  Results(
      {this.url,
        this.name,
        this.isfree,
        this.time,
        this.description,
        this.type,
        this.imageUrl,
        this.category,
        this.language,
        this.learn,
        this.creators,
        this.timeExpired,
        this.discountPercent,
        this.usesReamaining});

  Results.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    name = json['name'];
    isfree = json['isfree'];
    time = json['time'];
    description = json['description'];
    type = json['type'];
    imageUrl = json['image_url'];
    category = json['category'];
    language = json['language'];
    learn = json['learn'];
    creators = json['creators'];
    timeExpired = json['time_expired'];
    discountPercent = json['discount_percent'];
    usesReamaining = json['uses_reamaining'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['name'] = name;
    data['isfree'] = isfree;
    data['time'] = time;
    data['description'] = description;
    data['type'] = type;
    data['image_url'] = imageUrl;
    data['category'] = category;
    data['language'] = language;
    data['learn'] = learn;
    data['creators'] = creators;
    data['time_expired'] = timeExpired;
    data['discount_percent'] = discountPercent;
    data['uses_reamaining'] = usesReamaining;
    return data;
  }
}
