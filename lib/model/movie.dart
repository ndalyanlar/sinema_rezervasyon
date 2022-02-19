class Movie {
  String name;
  int ageLimit;
  List<String> choosenSeats = [];

  Movie({required this.name, this.ageLimit = 3});

  List<String> get seats => choosenSeats;
  void updateSeats(String seat) {
    choosenSeats.add(seat);
  }
}
