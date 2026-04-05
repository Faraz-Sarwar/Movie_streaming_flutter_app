import 'package:movies_app/theme/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/view_model/movies_view_model.dart';

class AllMovies extends StatefulWidget {
  const AllMovies({super.key});

  @override
  State<AllMovies> createState() => _AllMoviesState();
}

class _AllMoviesState extends State<AllMovies> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final moviesVM = context.read<MoviesViewModel>();
      await moviesVM.getMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        centerTitle: true,
        surfaceTintColor: AppColors.background,
      ),
      body: Column(
        children: [
          Consumer<MoviesViewModel>(
            builder: (context, value, child) {
              return Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: value.movies.length,
                  itemBuilder: (context, index) {
                    print('Total movies: ${value.movies.length}');
                    final movie = value.movies[index];
                    return Container(
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
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
