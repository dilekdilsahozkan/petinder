
class Animal {
  String id;
  String name;
  String category;
  String image;

  Animal();

  Animal.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    category = data['category'];
    image = data['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'image': image,
    };
  }
}