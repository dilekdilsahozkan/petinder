
class Event {
  final String imagePath, sex, title, description;
  final List categoryIds, galleryImages;

  Event(
      {this.imagePath,
      this.title,
      this.sex,
      this.description,
      this.categoryIds,
      this.galleryImages});
}

final catsCategory = Event(
    imagePath: "assets/images/kedi2.jpg",
    title: "Waiting For The Owner!",
    sex: "male",
    description: "2-year-old waiting for its' little life partner",
    galleryImages: [],
    categoryIds: [0, 1]);

final dogsCategory = Event(
    imagePath: "assets/images/dogs4.jpg",
    title: "Hug Her!",
    sex: "female",
    description: "2-year-old waiting for you",
    categoryIds: [0, 2],
    galleryImages: ["assets/images/dogs5.jpg", "assets/images/dogs4.jpg", "assets/images/dogs5.jpg"]);

final birdsCategory = Event(
    imagePath: "assets/images/bird.jpg",
    title: "2 Months",
    sex: "female",
    description: "",
    galleryImages: ["assets/images/bird4.jpg", "assets/images/bird5.jpg", "assets/images/bird6.jpg","assets/images/bird.jpg"],
    categoryIds: [0, 3]);

final events = [
  catsCategory,
  dogsCategory,
  birdsCategory,
];