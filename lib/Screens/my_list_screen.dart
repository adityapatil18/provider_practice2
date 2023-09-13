import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice2/Providers/movie_provider.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({super.key});

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  @override
  Widget build(BuildContext context) {
    final _myList = context.watch<MovieProvider>().myList;
    return Scaffold(
      appBar: AppBar(
        title: Text('My  list (${_myList.length})'),
      ),
      body: ListView.builder(
        itemCount: _myList.length,
        itemBuilder: (context, index) {
          final currentMovie = _myList[index];
          return Card(
            key: ValueKey(currentMovie.title),
            elevation: 4,
            child: ListTile(
              title: Text(currentMovie.title),
              subtitle: Text(
                currentMovie.duration ?? 'no information',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: TextButton(
                onPressed: () {
                  context.read<MovieProvider>().removeFromList(currentMovie);
                },
                child: Text(
                  'Remove',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
