class FeatureModel {
  FeatureModel({
    required this.id,
    required this.name,
    required this.price,
    required this.location,
  });

  int id;
  String name;
  String price;
  String location;

  factory FeatureModel.fromJson(Map<String, dynamic> json) {
    return FeatureModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      location: json['location'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'location': location,
      };
}
