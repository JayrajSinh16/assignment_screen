class Program {
  final String image;
  final String couchImage;
  final String title;
  final String trainer;
  final String goal;
  final String difficulty;
  final String duration;
  final String price;

  Program({
    required this.image,
    required this.couchImage,
    required this.title,
    required this.trainer,
    required this.goal,
    required this.difficulty,
    required this.duration,
    required this.price,
  });

  factory Program.fromFirestore(Map<String, dynamic> data) {
    return Program(
      image: data['image'] ?? '',
      couchImage: data['couchImage'] ?? '',
      title: data['title'] ?? '',
      trainer: data['trainer'] ?? '',
      goal: data['goal'] ?? '',
      difficulty: data['difficulty'] ?? '',
      duration: data['duration'] ?? '',
      price: data['price'] ?? '',
    );
  }
}