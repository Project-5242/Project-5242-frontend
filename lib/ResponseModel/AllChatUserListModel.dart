class AllChatUserListModel {
  int? status;
  String? message;
  List<AllChatList>? data;

  AllChatUserListModel({this.status, this.message, this.data});

  AllChatUserListModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => AllChatList.fromJson(e)).toList();
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

class AllChatList {
  String? conversationId;
  Receiver? receiver;
  LastMessage? lastMessage;

  AllChatList({this.conversationId, this.receiver, this.lastMessage});

  AllChatList.fromJson(Map<String, dynamic> json) {
    conversationId = json["conversationId"];
    receiver =
        json["receiver"] == null ? null : Receiver.fromJson(json["receiver"]);
    lastMessage = json["lastMessage"] == null
        ? null
        : LastMessage.fromJson(json["lastMessage"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["conversationId"] = conversationId;
    if (receiver != null) {
      _data["receiver"] = receiver?.toJson();
    }
    if (lastMessage != null) {
      _data["lastMessage"] = lastMessage?.toJson();
    }
    return _data;
  }
}

class LastMessage {
  String? id;
  String? text;
  bool? seen;
  String? timestamp;

  LastMessage({this.id, this.text, this.seen, this.timestamp});

  LastMessage.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    text = json["text"];
    seen = json["seen"];
    timestamp = json["timestamp"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["text"] = text;
    _data["seen"] = seen;
    _data["timestamp"] = timestamp;
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
