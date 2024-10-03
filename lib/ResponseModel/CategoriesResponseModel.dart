class CategoriesResponseModel {
  int? status;
  String? message;
  Data? data;

  CategoriesResponseModel({this.status, this.message, this.data});

  CategoriesResponseModel.fromJson(Map<String, dynamic> json) {
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
  List<CategoriesList>? categoriesList;
  Pagination? pagination;

  Data({this.categoriesList, this.pagination});

  Data.fromJson(Map<String, dynamic> json) {
    categoriesList = json["categories"] == null
        ? null
        : (json["categories"] as List)
            .map((e) => CategoriesList.fromJson(e))
            .toList();
    pagination = json["pagination"] == null
        ? null
        : Pagination.fromJson(json["pagination"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (categoriesList != null) {
      _data["categories"] = categoriesList?.map((e) => e.toJson()).toList();
    }
    if (pagination != null) {
      _data["pagination"] = pagination?.toJson();
    }
    return _data;
  }
}

class Pagination {
  int? page;
  int? limit;
  int? total;

  Pagination({this.page, this.limit, this.total});

  Pagination.fromJson(Map<String, dynamic> json) {
    page = json["page"];
    limit = json["limit"];
    total = json["total"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["page"] = page;
    _data["limit"] = limit;
    _data["total"] = total;
    return _data;
  }
}

class CategoriesList {
  String? id;
  bool? isSelected;
  String? categoryDescription;
  String? categoryName;
  String? userId;
  String? userName;
  String? createdAt;
  String? updatedAt;
  int? v;

  CategoriesList(
      {this.id,
      this.categoryDescription,
      this.categoryName,
      this.userId,
      this.userName,
      this.isSelected,
      this.createdAt,
      this.updatedAt,
      this.v});

  CategoriesList.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    categoryDescription = json["categoryDescription"];
    categoryName = json["categoryName"];
    userId = json["userId"];
    userName = json["userName"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["categoryDescription"] = categoryDescription;
    _data["categoryName"] = categoryName;
    _data["userId"] = userId;
    _data["userName"] = userName;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["__v"] = v;
    return _data;
  }
}
