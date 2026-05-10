import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/buku.dart';
import '../services/buku_service.dart';

class TambahBukuPage extends StatelessWidget {
  TambahBukuPage({super.key});

  final judulController = TextEditingController();
  final penulisController = TextEditingController();
  final kategoriController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Buku'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: judulController,
              decoration: const InputDecoration(
                labelText: 'Judul Buku',
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: penulisController,
              decoration: const InputDecoration(
                labelText: 'Penulis',
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: kategoriController,
              decoration: const InputDecoration(
                labelText: 'Kategori',
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                final buku = Buku(
                  judul: judulController.text,
                  penulis: penulisController.text,
                  kategori: kategoriController.text,
                );

                Provider.of<BukuService>(context, listen: false)
                    .tambahBuku(buku);

                Navigator.pop(context);
}