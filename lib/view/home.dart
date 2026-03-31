import 'package:flutter/material.dart';
import 'package:movies_app/components/custom_container.dart';
import 'package:movies_app/components/get_movies_by_category.dart';
import 'package:movies_app/theme/app_colors.dart';
import 'package:movies_app/view/all_movies_by_category.dart';
import 'package:movies_app/view_model/movies_view_model.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
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
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: AppColors.primaryText),
        ),
        centerTitle: true,
        backgroundColor: AppColors.background,
        surfaceTintColor: AppColors.background,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Hi, Faraz', style: TextStyle(fontSize: 28)),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),

                        child: Image.asset(
                          'assets/images/my_pic.jpeg',
                          height: 46,
                          width: 46,
                        ),
                      ),
                    ],
                  ),
                  const Text("What's on watchlist today?"),
                ],
              ),
              const SizedBox(height: 16),
              CustomContainer(
                height: MediaQuery.of(context).size.height * 0.066,
                widht: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      const Icon(Icons.search, size: 32),
                      const SizedBox(width: 16),
                      const Text(
                        'Search movies',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.mutedText,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Category', style: TextStyle(fontSize: 24)),
              const SizedBox(height: 16),
              Consumer<MoviesViewModel>(
                builder: (_, value, _) {
                  if (value.isLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (value.error != null) {
                    return Text('Error: ${value.error}');
                  } else {
                    return Consumer<MoviesViewModel>(
                      builder: (context, value, child) {
                        final genre = value.genres;

                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
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
                                  width: 190,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12),
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
              ),
              const SizedBox(height: 16),
              Text(
                'Action',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              //resuable widget to get movies by category
              const GetMoviesByCategory(category: 'Action'),
              const SizedBox(height: 24),

              Text(
                'Adventure',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const GetMoviesByCategory(category: 'Adventure'),

              const SizedBox(height: 16),
              Text(
                'Fantasy',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const GetMoviesByCategory(category: 'Fantasy'),
            ],
          ),
        ),
      ),
    );
  }
}
