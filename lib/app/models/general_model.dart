class GeneralModel {
  GeneralModel({
    this.status,
    this.message = 'Có lỗi xảy ra',
  });

  final bool? status;
  final String message;

  factory GeneralModel.fromJson(Map<String, dynamic> json) => GeneralModel(
        status: json["status"],
        message: json["message"],
      );
  factory GeneralModel.error() {
    return GeneralModel(
      status: false,
      message: 'Có lỗi xảy ra',
    );
  }
  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}

class ResultModel {
  ResultModel({
    this.status = 'false',
    this.message = 'Có lỗi xảy ra',
  });

  final String status;
  final String message;

  factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
        status: json["status"],
        message: json["message"],
      );
}
