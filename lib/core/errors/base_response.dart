import 'package:equatable/equatable.dart';

class BaseResponseEntity extends Equatable {
  const BaseResponseEntity({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}

class BaseResponseModel extends BaseResponseEntity {
  const BaseResponseModel({required super.message});

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) {
    return BaseResponseModel(message: json['message'] as String? ?? '');
  }
}
