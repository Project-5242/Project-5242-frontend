class GetUserDetailModel {
  int? status;
  String? message;
  Data? data;

  GetUserDetailModel({this.status, this.message, this.data});

  GetUserDetailModel.fromJson(Map<String, dynamic> json) {
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
  User? user;

  Data({this.user});

  Data.fromJson(Map<String, dynamic> json) {
    user = json["user"] == null ? null : User.fromJson(json["user"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (user != null) {
      _data["user"] = user?.toJson();
    }
    return _data;
  }
}

class User {
  String? id;
  String? fullName;
  String? email;
  String? mobileNumber;
  dynamic location;
  String? profilePhoto;
  bool? isEmailVerified;
  bool? isProvider;
  bool? isActive;
  String? fcmToken;
  List<dynamic>? categories;
  List<dynamic>? providerDetails;
  List<SavedProvider>? savedProvider;
  dynamic otp;
  dynamic otpExpire;
  String? createdAt;
  String? updatedAt;
  int? v;

  User(
      {this.id,
      this.fullName,
      this.email,
      this.mobileNumber,
      this.location,
      this.profilePhoto,
      this.isEmailVerified,
      this.isProvider,
      this.isActive,
      this.fcmToken,
      this.categories,
      this.providerDetails,
      this.savedProvider,
      this.otp,
      this.otpExpire,
      this.createdAt,
      this.updatedAt,
      this.v});

  User.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    fullName = json["fullName"];
    email = json["email"];
    mobileNumber = json["mobileNumber"];
    location = json["location"];
    profilePhoto = json["profilePhoto"];
    isEmailVerified = json["isEmailVerified"];
    isProvider = json["isProvider"];
    isActive = json["isActive"];
    fcmToken = json["fcmToken"];
    categories = json["categories"] ?? [];
    providerDetails = json["providerDetails"] ?? [];
    savedProvider = json["savedProvider"] == null
        ? null
        : (json["savedProvider"] as List)
            .map((e) => SavedProvider.fromJson(e))
            .toList();
    otp = json["otp"];
    otpExpire = json["otpExpire"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["fullName"] = fullName;
    _data["email"] = email;
    _data["mobileNumber"] = mobileNumber;
    _data["location"] = location;
    _data["profilePhoto"] = profilePhoto;
    _data["isEmailVerified"] = isEmailVerified;
    _data["isProvider"] = isProvider;
    _data["isActive"] = isActive;
    _data["fcmToken"] = fcmToken;
    if (categories != null) {
      _data["categories"] = categories;
    }
    if (providerDetails != null) {
      _data["providerDetails"] = providerDetails;
    }
    if (savedProvider != null) {
      _data["savedProvider"] = savedProvider?.map((e) => e.toJson()).toList();
    }
    _data["otp"] = otp;
    _data["otpExpire"] = otpExpire;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["__v"] = v;
    return _data;
  }
}

class SavedProvider {
  String? providerId;
  String? providerDetailsId;
  String? id;

  SavedProvider({this.providerId, this.providerDetailsId, this.id});

  SavedProvider.fromJson(Map<String, dynamic> json) {
    providerId = json["providerId"];
    providerDetailsId = json["providerDetailsId"];
    id = json["_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["providerId"] = providerId;
    _data["providerDetailsId"] = providerDetailsId;
    _data["_id"] = id;
    return _data;
  }
}
