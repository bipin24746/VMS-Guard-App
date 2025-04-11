
import 'package:dayonecontacts/features/all_notices/domain/entities/all_notice_integration.dart';

class AllNoticeIntegrationModel extends AllNoticesIntegration {
  AllNoticeIntegrationModel({
    required bool success,
    required List<Datum> data,
  }) : super(success: success, data: data);

  factory AllNoticeIntegrationModel.fromJson(Map<String, dynamic> json) {
    return AllNoticeIntegrationModel(
      success: json["success"],
      data: List<Datum>.from(json["data"].map((x) => DatumModel.fromJson(x))),
    );
  }
}

class DatumModel extends Datum{
  DatumModel({
    required String id,
    required String title,
    required String category,
    required String message,
    required List<dynamic> document,
    required DateTime createdAt,
  }) : super(
    id: id,
    title: title,
    category: category,
    message: message,
    document: document,
    createdAt: createdAt,
  );
  factory DatumModel.fromJson(Map<String, dynamic> json) {
    return DatumModel(
      id: json["id"] as String? ?? '',
      title: json["title"],
      category: json["category"],
      message: json["message"],
      document: List<dynamic>.from(json["document"].map((x) => x)),
      createdAt: DateTime.parse(json["createdAt"]),
    );
  }

}
