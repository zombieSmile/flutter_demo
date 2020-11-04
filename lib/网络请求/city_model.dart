class CityModel {
  int shengId;
  String shengName;
  List<CityRecordList> cityRecordList;

  CityModel({this.shengId, this.shengName, this.cityRecordList});

  CityModel.fromJson(Map<String, dynamic> json) {
    shengId = json['ShengId'];
    shengName = json['ShengName'];
    if (json['cityRecordList'] != null) {
      cityRecordList = new List<CityRecordList>();
      json['cityRecordList'].forEach((v) {
        cityRecordList.add(new CityRecordList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ShengId'] = this.shengId;
    data['ShengName'] = this.shengName;
    if (this.cityRecordList != null) {
      data['cityRecordList'] =
          this.cityRecordList.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'CityModel{ShiId: $shengId, ShiName: $shengName, cityRecordList: $cityRecordList}';
  }
}

class CityRecordList {
  int shiId;
  String shiName;

  CityRecordList({this.shiId, this.shiName});

  CityRecordList.fromJson(Map<String, dynamic> json) {
    shiId = json['ShiId'];
    shiName = json['ShiName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ShiId'] = this.shiId;
    data['ShiName'] = this.shiName;
    return data;
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'CityRecordList{shiId: $shiId, shiName: $shiName}';
  }
}
