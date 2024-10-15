class CreateNodeModel {
  dynamic status;
  String? message;
  Data? data;

  CreateNodeModel({this.status, this.message, this.data});

  CreateNodeModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  Provider? provider;
  ProviderDetails? providerDetails;

  Data({this.provider, this.providerDetails});

  Data.fromJson(Map<String, dynamic> json) {
    provider =
        json["provider"] == null ? null : Provider.fromJson(json["provider"]);
    providerDetails = json["providerDetails"] == null
        ? null
        : ProviderDetails.fromJson(json["providerDetails"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (provider != null) {
      _data["provider"] = provider?.toJson();
    }
    if (providerDetails != null) {
      _data["providerDetails"] = providerDetails?.toJson();
    }
    return _data;
  }
}

class ProviderDetails {
  String? id;
  ProviderId? providerId;
  List<Nodes>? nodes;
  int? totalView;
  String? createdAt;
  String? updatedAt;
  int? v;

  ProviderDetails(
      {this.id,
      this.providerId,
      this.nodes,
      this.totalView,
      this.createdAt,
      this.updatedAt,
      this.v});

  ProviderDetails.fromJson(Map<String, dynamic> json) {
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
  List<dynamic>? images;
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
    images = json["images"] ?? [];
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
  String? profilePhoto;

  ProviderId({this.id, this.fullName, this.profilePhoto});

  ProviderId.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    fullName = json["fullName"];
    profilePhoto = json["profilePhoto"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["fullName"] = fullName;
    _data["profilePhoto"] = profilePhoto;
    return _data;
  }
}

class Provider {
  String? name;
  String? photo;

  Provider({this.name, this.photo});

  Provider.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    photo = json["photo"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["photo"] = photo;
    return _data;
  }
}
