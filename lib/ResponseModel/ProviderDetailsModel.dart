class ProviderDetailsModel {
  int? status;
  String? message;
  List<ProviderDetailsList>? data;

  ProviderDetailsModel({this.status, this.message, this.data});

  ProviderDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null
        ? null
        : (json["data"] as List)
            .map((e) => ProviderDetailsList.fromJson(e))
            .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class ProviderDetailsList {
  String? id;
  ProviderId? providerId;
  List<Nodes>? nodes;
  int? totalView;
  String? createdAt;
  String? updatedAt;
  int? v;

  ProviderDetailsList(
      {this.id,
      this.providerId,
      this.nodes,
      this.totalView,
      this.createdAt,
      this.updatedAt,
      this.v});

  ProviderDetailsList.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    providerId = json["providerId"] == null
        ? null
        : ProviderId.fromJson(json["providerId"]);
    nodes = json["nodes"] == null
        ? null
        : (json["nodes"] as List).map((e) => Nodes.fromJson(e)).toList();
    totalView = json["totalView"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    if (providerId != null) {
      _data["providerId"] = providerId?.toJson();
    }
    if (nodes != null) {
      _data["nodes"] = nodes?.map((e) => e.toJson()).toList();
    }
    _data["totalView"] = totalView;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["__v"] = v;
    return _data;
  }
}

class Nodes {
  String? nodeId;
  String? addWorkHour;
  String? title;
  String? addDescription;
  List<String>? images;
  String? location;
  double? longitude;
  double? latitude;
  List<String>? categoryId;
  String? id;
  String? createdAt;

  Nodes(
      {this.nodeId,
      this.addWorkHour,
      this.title,
      this.addDescription,
      this.images,
      this.location,
      this.longitude,
      this.latitude,
      this.categoryId,
      this.id,
      this.createdAt});

  Nodes.fromJson(Map<String, dynamic> json) {
    nodeId = json["nodeId"];
    addWorkHour = json["addWorkHour"];
    title = json["title"];
    addDescription = json["addDescription"];
    images = json["images"] == null ? null : List<String>.from(json["images"]);
    location = json["location"];
    longitude = json["longitude"];
    latitude = json["latitude"];
    categoryId = json["categoryId"] == null
        ? null
        : List<String>.from(json["categoryId"]);
    id = json["_id"];
    createdAt = json["createdAt"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["nodeId"] = nodeId;
    _data["addWorkHour"] = addWorkHour;
    _data["title"] = title;
    _data["addDescription"] = addDescription;
    if (images != null) {
      _data["images"] = images;
    }
    _data["location"] = location;
    _data["longitude"] = longitude;
    _data["latitude"] = latitude;
    if (categoryId != null) {
      _data["categoryId"] = categoryId;
    }
    _data["_id"] = id;
    _data["createdAt"] = createdAt;
    return _data;
  }
}

class ProviderId {
  String? id;
  String? fullName;
  String? email;
  String? profilePhoto;

  ProviderId({this.id, this.fullName, this.email, this.profilePhoto});

  ProviderId.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    fullName = json["fullName"];
    email = json["email"];
    profilePhoto = json["profilePhoto"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["fullName"] = fullName;
    _data["email"] = email;
    _data["profilePhoto"] = profilePhoto;
    return _data;
  }
}
