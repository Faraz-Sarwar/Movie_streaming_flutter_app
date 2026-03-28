import 'package:flutter/material.dart';
import 'package:movies_app/theme/app_colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
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
        child: Column(
          children: [
            Row(
              children: [
                const Text('Hi, Faraz', style: TextStyle(fontSize: 28)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
