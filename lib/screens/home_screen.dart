import 'package:flutter/material.dart';
import '../models/book.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final books = [
      Book(title: "Flutter Dasar", author: "nadhief"),
      Book(title: "Pemrograman Dart", author: "Budi"),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("PerpusKu 📚"),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(books[index].title),
              subtitle: Text(books[index].author),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailScreen(book: books[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}