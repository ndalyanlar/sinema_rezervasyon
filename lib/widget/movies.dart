import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sinema_rezervasyon/base/provider.dart';
import 'package:sinema_rezervasyon/screen/choose_seats.dart';

class MovieList extends StatelessWidget {
  const MovieList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MovieProvider>(
        create: (_) => MovieProvider(),
        builder: (context, child) {
          return RefreshIndicator(
            onRefresh: () {
              return Future.delayed(const Duration(seconds: 1))
                  .whenComplete(() {
                movieProvider = MovieProvider();
              });
            },
            child: ListView(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ChooseSeats(
                                  movie: context.read<MovieProvider>().movie1,
                                )));
                  },
                  child: Card(
                    child: Row(
                      children: [
                        SizedBox(
                          height: 200,
                          width: 200,
                          child: Image.network(
                            "https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_.jpg",
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.read<MovieProvider>().movie1.name,
                                style: Theme.of(context).textTheme.headline5,
                                maxLines: 4,
                              ),
                              Text(
                                "Yaş Sınır: ${context.read<MovieProvider>().movie1.ageLimit}",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ChooseSeats(
                                  movie: context.read<MovieProvider>().movie2,
                                )));
                  },
                  child: Card(
                    child: Row(
                      children: [
                        SizedBox(
                          height: 200,
                          width: 200,
                          child: Image.network(
                            "https://upload.wikimedia.org/wikipedia/tr/6/68/Hobbit_Beklenmedik_Yolculuk_T%C3%BCrk%C3%A7e.jpeg",
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.read<MovieProvider>().movie2.name,
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              Text(
                                "Yaş Sınır: ${context.read<MovieProvider>().movie2.ageLimit}",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
