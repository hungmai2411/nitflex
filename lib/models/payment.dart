class Payment {
  final String img;
  final String name;
  final String description;
  bool isPicked;

  Payment({
    required this.img,
    required this.description,
    required this.name,
    this.isPicked = false,
  });
}
