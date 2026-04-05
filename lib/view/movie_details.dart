import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/components/custom_container.dart';
import 'package:movies_app/model/movie_model.dart';
import 'package:movies_app/theme/app_colors.dart';
import 'package:movies_app/view_model/movie_details_screen_filtering.dart';

class MovieDetails extends StatefulWidget {
  final Data movie;
  const MovieDetails({super.key, required this.movie});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    final filter = DetailsScreenFiltering();
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Stack(
                children: [
                  Image.network(
                    widget.movie.poster.toString(),
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: double.infinity,
                    fit: BoxFit.cover,

                    errorBuilder: (context, error, stackTrace) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.error, color: AppColors.primary),
                          Center(
                            child: const Text(
                              "This movie doesn't have a poster or have failed to load.",
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 16,
                    ),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        height: 46,
                        width: 46,
                        decoration: BoxDecoration(
                          color: AppColors.divider,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(CupertinoIcons.left_chevron),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 16,
                      ),
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          height: 46,
                          width: 46,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 252, 77, 86),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(Icons.playlist_add),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 252, 77, 86),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: const Icon(Icons.play_arrow, size: 54),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomContainer(
                        height: 44,
                        widht: 80,
                        child: Center(
                          child: Text(widget.movie.rated.toString()),
                        ),
                      ),
                      CustomContainer(
                        height: 44,
                        widht: 80,
                        child: Center(
                          child: Text(filter.getOneGenre(widget.movie)),
                        ),
                      ),

                      CustomContainer(
                        height: 44,
                        widht: 90,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(widget.movie.imdbRating.toString()),
                              const SizedBox(width: 4),
                              Icon(Icons.star, color: AppColors.rating),
                            ],
                          ),
                        ),
                      ),
                      CustomContainer(
                        height: 44,
                        widht: 90,
                        child: Center(
                          child: Text(filter.getYear(widget.movie)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Movie Story',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(widget.movie.plot.toString()),
                  const SizedBox(height: 16),
                  const Text(
                    'Actors',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.movie.actors.toString(),
                    style: TextStyle(fontSize: 16),
                  ),

                  const SizedBox(height: 16),
                  const Text(
                    'Directed by',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.movie.director.toString(),
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
