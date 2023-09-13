import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice2/Providers/movie_provider.dart';
import 'package:provider_practice2/Screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MovieProvider(),
      child: ProviderPractice2(),
    ),
  );
}

class ProviderPractice2 extends StatelessWidget {
  const ProviderPractice2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
