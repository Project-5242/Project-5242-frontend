class NotificationListModel {
  dynamic status;
  String? message;
  List<NotificationList>? data;

  NotificationListModel({this.status, this.message, this.data});

  NotificationListModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null
        ? null
        : (json["data"] as List)
            .map((e) => NotificationList.fromJson(e))
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

class NotificationList {
  String? id;
  String? userId;
  String? title;
  String? message;
  String? type;
  bool? isRead;
  String? createdAt;
  dynamic v;

  NotificationList(
      {this.id,
      this.userId,
      this.title,
      this.message,
      this.type,
      this.isRead,
      this.createdAt,
      this.v});

  NotificationList.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    userId = json["userId"];
    title = json["title"];
    message = json["message"];
    type = json["type"];
    isRead = json["isRead"];
    createdAt = json["createdAt"];
    v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["userId"] = userId;
    _data["title"] = title;
    _data["message"] = message;
    _data["type"] = type;
    _data["isRead"] = isRead;
    _data["createdAt"] = createdAt;
    _data["__v"] = v;
    return _data;
  }
}
