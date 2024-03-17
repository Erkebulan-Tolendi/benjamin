class RestaurantModel {
  String adress = '', name = '', imgUrl = '', playmentUrl = '', phone = '';

  RestaurantModel({
    required this.adress,
    required this.name,
    required this.imgUrl,
    required this.playmentUrl,
    required this.phone,
  });

  RestaurantModel.fromJson(Map<String, dynamic> json) {
    adress = json['adress'];
    name = json['name'];
    imgUrl = json['imgUrl'];
    playmentUrl = json['playmentUrl'];
    phone = json['phone'];
  }
  Map<String, dynamic> toJson() {
    var data = Map<String, dynamic>();
    data['adress'] = this.adress;
    data['name'] = this.name;
    data['imgUrl'] = this.imgUrl;
    data['playmentUrl'] = this.playmentUrl;
    data['phone'] = this.phone;

    return data;
  }
}
