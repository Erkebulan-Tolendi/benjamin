class Furniture {
  final String name;
  final String description;
  final int price;
  final String image;
  final List<Material> materials;

  Furniture({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.materials,
  });

  factory Furniture.fromJson(Map<String, dynamic> json) {
    return Furniture(
      name: json['name'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
      materials: List<Material>.from(
          json['materials'].map((m) => Material.fromJson(m))),
    );
  }
}

class Material {
  final String name;
  final String img;
  final int price;

  Material({
    required this.name,
    required this.img,
    required this.price,
  });

  factory Material.fromJson(Map<String, dynamic> json) {
    return Material(
      name: json['name'],
      img: json['img'],
      price: json['price'],
    );
  }
}

class FurnitureType {
  final String name;
  final String previewImage;
  final List<Furniture> furnitures;

  FurnitureType({
    required this.name,
    required this.previewImage,
    required this.furnitures,
  });

  factory FurnitureType.fromJson(Map<String, dynamic> json) {
    return FurnitureType(
      name: json['name'],
      previewImage: json['previewImage'],
      furnitures: List<Furniture>.from(
          json['furnitures'].map((f) => Furniture.fromJson(f))),
    );
  }
}
