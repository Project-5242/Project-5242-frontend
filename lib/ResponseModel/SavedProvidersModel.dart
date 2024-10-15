class SaveNodeListModel {
  int? status;
  String? message;
  List<AllSaveNode>? data;

  SaveNodeListModel({this.status, this.message, this.data});

  SaveNodeListModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => AllSaveNode.fromJson(e)).toList();
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

class AllSaveNode {
  String? providerId;
  String? fullName;
  String? email;
  String? profilePhoto;
  List<Nodes>? nodes;
  bool? isSaved;

  AllSaveNode(
      {this.providerId,
      this.fullName,
      this.email,
      this.profilePhoto,
      this.nodes,
      this.isSaved});

  AllSaveNode.fromJson(Map<String, dynamic> json) {
    providerId = json["providerId"];
    fullName = json["fullName"];
    email = json["email"];
    profilePhoto = json["profilePhoto"];
    nodes = json["nodes"] == null
        ? null
        : (json["nodes"] as List).map((e) => Nodes.fromJson(e)).toList();
    isSaved = json["isSaved"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["providerId"] = providerId;
    _data["fullName"] = fullName;
    _data["email"] = email;
    _data["profilePhoto"] = profilePhoto;
    if (nodes != null) {
      _data["nodes"] = nodes?.map((e) => e.toJson()).toList();
    }
    _data["isSaved"] = isSaved;
    return _data;
  }
}

class Nodes {
  String? addWorkHour;
  String? title;
  String? addDescription;
  List<String>? images;
  String? location;
  double? longitude;
  double? latitude;
  List<String>? categoryId;
  String? id;
  String? nodeId;
  String? createdAt;

  Nodes(
      {this.addWorkHour,
      this.title,
      this.addDescription,
      this.images,
      this.location,
      this.longitude,
      this.latitude,
      this.categoryId,
      this.id,
      this.nodeId,
      this.createdAt});

  Nodes.fromJson(Map<String, dynamic> json) {
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
    nodeId = json["nodeId"];
    createdAt = json["createdAt"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
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
    _data["nodeId"] = nodeId;
    _data["createdAt"] = createdAt;
    return _data;
  }
}
