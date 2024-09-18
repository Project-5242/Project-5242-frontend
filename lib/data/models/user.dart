// {
//         "_id": "66ead8d7d1dcea4b55132ecd",
//         "fullName": "hitanshu gogoi",
//         "email": "hitanshugogoi@gmail.com",
//         "password": "$2b$10$fqBPqlvAxI92zrzBYgkNrOfuvkE9iFPZ6Z277TDTgNL6jODP0biMO",
//         "mobileNumber": "123456789",
//         "profilePhoto": "",
//         "isEmailVerified": true,
//         "isProvider": false,
//         "isActive": true,
//         "fcmToken": "",
//         "category": null,
//         "otp": null,
//         "otpExpire": null,
//         "createdAt": "2024-09-18T13:42:47.238Z",
//         "updatedAt": "2024-09-18T13:43:43.886Z",
//         "__v": 0
//     },

import 'package:flutter_project/data/constants/constants.dart';
import 'package:flutter_project/data/models/model.dart';

class UserModel extends Model {
  final String? id;
  final String? fullName;
  final String? email;
  final String? password;
  final String? mobileNumber;
  final String? profilePhoto;
  final bool? isEmailVerified;
  final bool? isProvider;
  final bool? isActive;
  final String? fcmToken;
  final String? category;
  final String? otp;
  final String? otpExpire;
  final String? createdAt;
  final String? updatedAt;

  UserModel({
    this.id,
    this.fullName,
    this.email,
    this.password,
    this.mobileNumber,
    this.profilePhoto,
    this.isEmailVerified,
    this.isProvider,
    this.isActive,
    this.fcmToken,
    this.category,
    this.otp,
    this.otpExpire,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      fullName: json['fullName'],
      email: json['email'],
      password: json['password'],
      mobileNumber: json['mobileNumber'],
      profilePhoto: json['profilePhoto'],
      isEmailVerified: json['isEmailVerified'],
      isProvider: json['isProvider'],
      isActive: json['isActive'],
      fcmToken: json['fcmToken'],
      category: json['category'],
      otp: json['otp'],
      otpExpire: json['otpExpire'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  @override
  Json get toJson {
    /// send if it not null
    Json json = {};
    if (id != null) json['_id'] = id;
    if (fullName != null) json['fullName'] = fullName;
    if (email != null) json['email'] = email;
    if (password != null) json['password'] = password;
    if (mobileNumber != null) json['mobileNumber'] = mobileNumber;
    if (profilePhoto != null) json['profilePhoto'] = profilePhoto;
    if (isEmailVerified != null) json['isEmailVerified'] = isEmailVerified;
    if (isProvider != null) json['isProvider'] = isProvider;
    if (isActive != null) json['isActive'] = isActive;
    if (fcmToken != null) json['fcmToken'] = fcmToken;
    if (category != null) json['category'] = category;
    if (otp != null) json['otp'] = otp;
    if (otpExpire != null) json['otpExpire'] = otpExpire;
    if (createdAt != null) json['createdAt'] = createdAt;
    if (updatedAt != null) json['updatedAt'] = updatedAt;
    return json;
  }

  String get fullNameOrEmail => fullName ?? email ?? '';

  /// copyWith

  @override
  UserModel copyWith({
    String? id,
    String? fullName,
    String? email,
    String? password,
    String? mobileNumber,
    String? profilePhoto,
    bool? isEmailVerified,
    bool? isProvider,
    bool? isActive,
    String? fcmToken,
    String? category,
    String? otp,
    String? otpExpire,
    String? createdAt,
    String? updatedAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      password: password ?? this.password,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      profilePhoto: profilePhoto ?? this.profilePhoto,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      isProvider: isProvider ?? this.isProvider,
      isActive: isActive ?? this.isActive,
      fcmToken: fcmToken ?? this.fcmToken,
      category: category ?? this.category,
      otp: otp ?? this.otp,
      otpExpire: otpExpire ?? this.otpExpire,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
