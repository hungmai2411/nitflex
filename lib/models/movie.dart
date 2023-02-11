// ignore_for_file: public_member_api_docs, sort_constructors_first
class Movie {
  final String image;
  final String name;
  final String genre;
  final double rating;
  final String dateTime;
  final String status;
  final String numOfEpisode;
  final double price;
  bool isAdded;

  Movie({
    required this.image,
    required this.name,
    required this.genre,
    required this.rating,
    required this.dateTime,
    required this.status,
    required this.numOfEpisode,
    required this.price,
    this.isAdded = false,
  });
}
