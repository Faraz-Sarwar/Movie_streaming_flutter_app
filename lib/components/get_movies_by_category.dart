import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movies_app/theme/app_colors.dart';
import 'package:movies_app/view_model/movies_view_model.dart';
import 'package:provider/provider.dart';

class GetMoviesByCategory extends StatefulWidget {
  final String category;
  const GetMoviesByCategory({super.key, required this.category});

  @override
  State<GetMoviesByCategory> createState() => _GetMoviesByCategoryState();
}

class _GetMoviesByCategoryState extends State<GetMoviesByCategory> {
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final moviesVM = context.read<MoviesViewModel>();
      await moviesVM.getMovies();
      await moviesVM.getGenres();
    });
  }

  @override
  Widget build(BuildContext context) {
    final MoviesViewModel moviesVM = context.watch<MoviesViewModel>();
    return FutureBuilder(
      future: moviesVM.filterMoviesByGenre(widget.category),
      builder: (context, response) {
        if (response.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!response.hasData || response.data!.isEmpty) {
          return Center(child: const Text('No movies in that category'));
        }
        return SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: response.data!.length,
            itemBuilder: (context, index) {
              final movie = response.data![index];
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
                          Icon(Icons.error, color: AppColors.primary, size: 44),
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
    );
  }
}
