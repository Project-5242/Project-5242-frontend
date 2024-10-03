class CommonAuthModel {
  dynamic status;
  String? message;
  Data? data;
  String? token;

  CommonAuthModel({this.status, this.message, this.data, this.token});

  CommonAuthModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
    token = json["token"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    _data["token"] = token;
    return _data;
  }
}

class Data {
  String? id;
  String? fullName;
  String? email;
  String? password;
  String? mobileNumber;
  dynamic location;
  String? profilePhoto;
  bool? isEmailVerified;
  bool? isProvider;
  bool? isActive;
  String? fcmToken;
  String? category;
  List<dynamic>? providerDetails;
  List<dynamic>? savedProvider;
  dynamic otp;
  dynamic otpExpire;
  String? createdAt;
  String? updatedAt;
  dynamic v;

  Data(
      {this.id,
      this.fullName,
      this.email,
      this.password,
      this.mobileNumber,
      this.location,
      this.profilePhoto,
      this.isEmailVerified,
      this.isProvider,
      this.isActive,
      this.fcmToken,
      this.category,
      this.providerDetails,
      this.savedProvider,
      this.otp,
      this.otpExpire,
      this.createdAt,
      this.updatedAt,
      this.v});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    fullName = json["fullName"];
    email = json["email"];
    password = json["password"];
    mobileNumber = json["mobileNumber"];
    location = json["location"];
    profilePhoto = json["profilePhoto"];
    isEmailVerified = json["isEmailVerified"];
    isProvider = json["isProvider"];
    isActive = json["isActive"];
    fcmToken = json["fcmToken"];
    category = json["category"];
    providerDetails = json["providerDetails"] ?? [];
    savedProvider = json["savedProvider"] ?? [];
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
    _data["password"] = password;
    _data["mobileNumber"] = mobileNumber;
    _data["location"] = location;
    _data["profilePhoto"] = profilePhoto;
    _data["isEmailVerified"] = isEmailVerified;
    _data["isProvider"] = isProvider;
    _data["isActive"] = isActive;
    _data["fcmToken"] = fcmToken;
    _data["category"] = category;
    if (providerDetails != null) {
      _data["providerDetails"] = providerDetails;
    }
    if (savedProvider != null) {
      _data["savedProvider"] = savedProvider;
    }
    _data["otp"] = otp;
    _data["otpExpire"] = otpExpire;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["__v"] = v;
    return _data;
  }
}
