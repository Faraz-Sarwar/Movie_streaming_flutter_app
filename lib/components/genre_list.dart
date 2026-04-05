import 'package:flutter/material.dart';
import 'package:movies_app/theme/app_colors.dart';
import 'package:movies_app/view/all_movies_by_category.dart';
import 'package:movies_app/view_model/movies_view_model.dart';
import 'package:provider/provider.dart';

class GenreList extends StatefulWidget {
  const GenreList({super.key});

  @override
  State<GenreList> createState() => _GenreListState();
}

class _GenreListState extends State<GenreList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesViewModel>(
      builder: (_, value, _) {
        if (value.isLoading) {
          return Center(child: const CircularProgressIndicator());
        }
        if (value.error != null) {
          return Text('Error: ${value.error}');
        } else {
          return Consumer<MoviesViewModel>(
            builder: (context, value, child) {
              final genre = value.genres;

              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.065,
                child: ListView.builder(
                  itemCount: value.genres.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AllMoviesByCategory(
                            category: genre.elementAt(index)!,
                          ),
                        ),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(right: 12),
                        width: 180,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 32,
                                ),
                                child: Text(
                                  genre.elementAt(index)!,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        }
      },
    );
  }
}
