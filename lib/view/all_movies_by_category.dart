import 'package:flutter/material.dart';
import 'package:movies_app/components/custom_container.dart';
import 'package:movies_app/components/grid_movies_list.dart';
import 'package:movies_app/theme/app_colors.dart';

class AllMoviesByCategory extends StatefulWidget {
  final String category;
  const AllMoviesByCategory({super.key, required this.category});

  @override
  State<AllMoviesByCategory> createState() => _AllMoviesByCategoryState();
}

class _AllMoviesByCategoryState extends State<AllMoviesByCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.category), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            GridMoviesList(category: widget.category),
          ],
        ),
      ),
    );
  }
}
