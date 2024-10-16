class AllMessageModel {
  dynamic status;
  String? message;
  Data? data;

  AllMessageModel({this.status, this.message, this.data});

  AllMessageModel.fromJson(Map<String, dynamic> json) {
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
  List<Messages>? messages;
  int? totalPages;

  Data({this.messages, this.totalPages});

  Data.fromJson(Map<String, dynamic> json) {
    messages = json["messages"] == null
        ? null
        : (json["messages"] as List).map((e) => Messages.fromJson(e)).toList();
    totalPages = json["totalPages"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (messages != null) {
      _data["messages"] = messages?.map((e) => e.toJson()).toList();
    }
    _data["totalPages"] = totalPages;
    return _data;
  }
}

class Messages {
  String? id;
  String? text;
  User? user;
  Receiver? receiver;
  String? conversationId;
  bool? seen;
  bool? sentByUser;
  String? timestamp;
  String? createdAt;
  String? updatedAt;
  int? v;

  Messages(
      {this.id,
      this.text,
      this.user,
      this.receiver,
      this.sentByUser,
      this.conversationId,
      this.seen,
      this.timestamp,
      this.createdAt,
      this.updatedAt,
      this.v});

  Messages.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    text = json["text"];
    user = json["user"] == null ? null : User.fromJson(json["user"]);
    receiver =
        json["receiver"] == null ? null : Receiver.fromJson(json["receiver"]);
    conversationId = json["conversationId"];
    seen = json["seen"];
    sentByUser = json["sentByUser"];
    timestamp = json["timestamp"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["text"] = text;
    _data["sentByUser"] = sentByUser;
    if (user != null) {
      _data["user"] = user?.toJson();
    }
    if (receiver != null) {
      _data["receiver"] = receiver?.toJson();
    }
    _data["conversationId"] = conversationId;
    _data["seen"] = seen;
    _data["timestamp"] = timestamp;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["__v"] = v;
    return _data;
  }
}

class Receiver {
  String? id;
  String? fullName;
  String? email;
  String? profilePhoto;

  Receiver({this.id, this.fullName, this.email, this.profilePhoto});

  Receiver.fromJson(Map<String, dynamic> json) {
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

class User {
  String? id;
  String? fullName;
  String? email;
  String? profilePhoto;

  User({this.id, this.fullName, this.email, this.profilePhoto});

  User.fromJson(Map<String, dynamic> json) {
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
