import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/buku_service.dart';
import 'tambah_buku_page.dart';
import 'detail_buku_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController cariController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bukuService = Provider.of<BukuService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perpusku App'),
        backgroundColor: Colors.blue,
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: cariController,
              decoration: InputDecoration(
                hintText: 'Cari Buku...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: bukuService.daftarBuku.length,
              itemBuilder: (context, index) {
                final buku = bukuService.daftarBuku[index];

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: const Icon(Icons.book),
                    title: Text(buku.judul),
                    subtitle: Text(buku.penulis),

}