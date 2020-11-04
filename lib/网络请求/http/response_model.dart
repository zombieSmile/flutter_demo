class ResponseModel {
  String message;
  String errCode;
  dynamic data;

  ResponseModel({this.message, this.errCode, this.data});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['ErrMsg'];
    errCode = json['MsgCode'];
    data = json['Info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ErrMsg'] = this.message;
    data['MsgCode'] = this.errCode;
    data['Info'] = this.data;
    return data;
  }
}
