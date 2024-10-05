class SavedProvidersModel {
  int? status;
  String? message;
  List<SaveProviderList>? data;

  SavedProvidersModel({this.status, this.message, this.data});

  SavedProvidersModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null
        ? null
        : (json["data"] as List)
            .map((e) => SaveProviderList.fromJson(e))
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

class SaveProviderList {
  ProviderId? providerId;
  dynamic providerDetailsId;
  String? id;

  SaveProviderList({this.providerId, this.providerDetailsId, this.id});

  SaveProviderList.fromJson(Map<String, dynamic> json) {
    providerId = json["providerId"] == null
        ? null
        : ProviderId.fromJson(json["providerId"]);
    providerDetailsId = json["providerDetailsId"];
    id = json["_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (providerId != null) {
      _data["providerId"] = providerId?.toJson();
    }
    _data["providerDetailsId"] = providerDetailsId;
    _data["_id"] = id;
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
