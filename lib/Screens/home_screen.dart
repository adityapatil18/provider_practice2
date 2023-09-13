import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice2/Providers/movie_provider.dart';
import 'package:provider_practice2/Screens/my_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final movies = context.watch<MovieProvider>().movies;
    final myList = context.watch<MovieProvider>().myList;
    // final moviesProvider = Provider.of<MovieProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Practice'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MyListScreen()));
              },
              icon: Icon(Icons.favorite),
              label: Text(
                'Go to my list (${myList.length})',
                style: TextStyle(fontSize: 24),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 20),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final currentMovie = movies[index];
                  return Card(
                    key: ValueKey(currentMovie.title),
                    color: Colors.teal,
                    elevation: 4,
                    child: ListTile(
                      title: Text(
                        currentMovie.title,
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        currentMovie.duration ?? 'no information',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: myList.contains(currentMovie)
                              ? Colors.red
                              : Colors.white,
                        ),
                        onPressed: () {
                          if (!myList.contains(currentMovie)) {
                            context
                                .read<MovieProvider>()
                                .addToList(currentMovie);
                          } else {
                            context
                                .read<MovieProvider>()
                                .removeFromList(currentMovie);
                          }
                        },
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
