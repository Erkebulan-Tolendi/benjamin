class MaterialsType {
  late final String name;
  late final String img;
  late final String desc;
  late final int price;

  MaterialsType({
    required this.name,
    required this.desc,
    required this.img,
    required this.price,
  });

  factory MaterialsType.fromJson(Map<String, dynamic> json) {
    return MaterialsType(
      name: json['name'],
      desc: json['desc'],
      img: json['img'],
      price: json['price'],
    );
  }
}
