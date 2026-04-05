import 'package:flutter/material.dart';
import 'package:movies_app/theme/app_colors.dart';
import 'package:movies_app/view/movie_details.dart';
import 'package:movies_app/view_model/movies_view_model.dart';
import 'package:provider/provider.dart';

class WatchList extends StatefulWidget {
  const WatchList({super.key});

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  @override
  Widget build(BuildContext context) {
    final MoviesViewModel moviesVm = context.watch<MoviesViewModel>();
    return Scaffold(
      appBar: AppBar(title: const Text('Your watchlist'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 20,
                ),
                itemCount: moviesVm.moviesWatchList.length,
                itemBuilder: (context, index) {
                  final movie = moviesVm.moviesWatchList[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MovieDetails(movie: movie),
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(right: 12),
                      height: MediaQuery.of(context).size.height * 0.22,
                      width: 180,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          movie.poster ?? '',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.error,
                                  color: AppColors.primary,
                                  size: 44,
                                ),
                                const Text('Error loading image!'),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
