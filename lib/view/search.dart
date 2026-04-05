import 'package:flutter/material.dart';
import 'package:movies_app/model/movie_model.dart';
import 'package:movies_app/theme/app_colors.dart';
import 'package:movies_app/view_model/movies_view_model.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchContoller = TextEditingController();
  List<Data> filteredMovies = [];

  void filterMoviesOnSearch(String query) {
    final viewModel = Provider.of<MoviesViewModel>(context, listen: false);
    setState(() {
      filteredMovies = viewModel.movies.where((movie) {
        final movieTitle = movie.title ?? '';
        final searchQuery = query.toString();
        return movieTitle.toLowerCase().contains(searchQuery.toLowerCase());
      }).toList();
    });
  }

  @override
  void dispose() {
    searchContoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: searchContoller,
              onChanged: filterMoviesOnSearch,
              decoration: InputDecoration(
                hintText: 'Search movies',
                prefixIcon: Icon(Icons.search),
                suffixIcon: searchContoller.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            searchContoller.clear();
                          });
                        },
                        icon: Icon(Icons.clear),
                      )
                    : null,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.border),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.border),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: filteredMovies.length,
                itemBuilder: (context, index) {
                  final movie = filteredMovies[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.078,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.border,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            movie.poster ?? "",
                            errorBuilder: (context, error, stackTrace) {
                              return Text('Error');
                            },
                            fit: BoxFit.cover,
                            width: 46,
                            height: 46,
                          ),
                        ),
                        title: Text(
                          movie.title ?? 'No Title',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(movie.released ?? 'Unspecified'),
                        trailing: Text(
                          movie.imdbRating ?? "No ratings",
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.rating,
                          ),
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
