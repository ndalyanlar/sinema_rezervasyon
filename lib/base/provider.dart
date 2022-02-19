import 'package:flutter/material.dart';
import 'package:sinema_rezervasyon/model/movie.dart';

class MovieProvider extends ChangeNotifier {
  Movie movie1 = Movie(
    name: "The Lord Of The Rings",
    ageLimit: 4,
  );
  Movie movie2 = Movie(name: "Hobbit", ageLimit: 18);

  List<Movie> get movieList => [movie1, movie2];

  void addSeats(List<String> values) {
    values.toList().forEach((element) {
      movie1.updateSeats(element);
      notifyListeners();
    });
  }
}

MovieProvider movieProvider = MovieProvider();
