
import 'package:generic_services_package/models/generic/validation_model.dart';

class Result {
  final bool isSuccess;
  final String? errorMessage;
  final int status;
  final Validation? validation;

  Result({
    required this.isSuccess,
    this.errorMessage,
    required this.status,
    this.validation,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      isSuccess: json['isSuccess'],
      errorMessage: json['errorMessage'] ,
      status: json['status'],
      validation: json['validation'] != null
          ? Validation.fromJson(json['validation'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isSuccess': isSuccess,
      'errorMessage': errorMessage,
      'status': status,
      'validation': validation?.toJson(),
    };
  }
}
