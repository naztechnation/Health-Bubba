class MedicationSubCategory {
  bool? ok;
  String? message;
  MedicationSubCategoryData? data;

  MedicationSubCategory({this.ok, this.message, this.data});

  MedicationSubCategory.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    message = json['message'];
    data = json['data'] != null ? MedicationSubCategoryData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ok'] = ok;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class MedicationSubCategoryData {
  List<Category>? category;
  List<Medications>? medications;
  dynamic user;

  MedicationSubCategoryData({this.category, this.medications, this.user});

  MedicationSubCategoryData.fromJson(Map<String, dynamic> json) {
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(Category.fromJson(v));
      });
    }
    if (json['medications'] != null) {
      medications = <Medications>[];
      json['medications'].forEach((v) {
        medications!.add(Medications.fromJson(v));
      });
    }
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (category != null) {
      data['category'] = category!.map((v) => v.toJson()).toList();
    }
    if (medications != null) {
      data['medications'] = medications!.map((v) => v.toJson()).toList();
    }
    data['user'] = user;
    return data;
  }
}

class Category {
  num? categoryId;
  String? categoryName;

  Category({this.categoryId, this.categoryName});

  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    return data;
  }
}

class Medications {
  num? medicationId;
  String? medicationName;
  String? medicationDesc;
  num? medicationPrice;
  num? medicationCategoryId;

  Medications(
      {this.medicationId,
      this.medicationName,
      this.medicationDesc,
      this.medicationPrice,
      this.medicationCategoryId});

  Medications.fromJson(Map<String, dynamic> json) {
    medicationId = json['medication_id'];
    medicationName = json['medication_name'];
    medicationDesc = json['medication_desc'];
    medicationPrice = json['medication_price'];
    medicationCategoryId = json['medication_category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['medication_id'] = medicationId;
    data['medication_name'] = medicationName;
    data['medication_desc'] = medicationDesc;
    data['medication_price'] = medicationPrice;
    data['medication_category_id'] = medicationCategoryId;
    return data;
  }
}
