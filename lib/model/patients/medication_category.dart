class MedicationCategory {
  bool? ok;
  String? message;
  List<MedicationCategoryData>? data;

  MedicationCategory({this.ok, this.message, this.data});

  MedicationCategory.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    message = json['message'];
    if (json['data'] != null) {
      data = <MedicationCategoryData>[];
      json['data'].forEach((v) {
        data!.add(MedicationCategoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ok'] = ok;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MedicationCategoryData {
  int? categoryId;
  String? categoryName;

  MedicationCategoryData({this.categoryId, this.categoryName});

  MedicationCategoryData.fromJson(Map<String, dynamic> json) {
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
