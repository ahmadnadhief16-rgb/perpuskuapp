import 'package:flutter/material.dart';

class EditBukuPage extends StatelessWidget {

  const EditBukuPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Edit Buku'),
      ),

      body: const Center(
        child: Text('Halaman Edit Buku'),
      ),
    );
  }
}