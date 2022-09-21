class DebtsModel {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<Data>? data;

  DebtsModel({this.page, this.perPage, this.total, this.totalPages, this.data});

  DebtsModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['per_page'] = this.perPage;
    data['total'] = this.total;
    data['total_pages'] = this.totalPages;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? img;
  String? until;
  String? amount;
  String? outOfAmount;

  Data(
      {this.id,
      this.name,
      this.img,
      this.until,
      this.amount,
      this.outOfAmount});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['Name'];
    img = json['Img'];
    until = json['Until'];
    amount = json['Amount'];
    outOfAmount = json['OutOfAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Name'] = this.name;
    data['Img'] = this.img;
    data['Until'] = this.until;
    data['Amount'] = this.amount;
    data['OutOfAmount'] = this.outOfAmount;
    return data;
  }
}
