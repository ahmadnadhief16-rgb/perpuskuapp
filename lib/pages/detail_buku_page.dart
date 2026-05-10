import 'package:flutter/material.dart';
import '../models/buku.dart';

class DetailBukuPage extends StatelessWidget {
  final Buku buku;

  const DetailBukuPage({
    super.key,
    required this.buku,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Buku'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              buku.judul,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Text('Penulis : ${buku.penulis}'),
            const SizedBox(height: 10),
            Text('Kategori : ${buku.kategori}'),
          ],
        ),
      ),
    );
  }
}