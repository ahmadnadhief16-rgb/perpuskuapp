import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/buku.dart';
import '../services/buku_service.dart';
import 'detail_buku_page.dart';
import 'edit_buku_page.dart';
import 'tambah_buku_page.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() =>
      _HomePageState();
}

class _HomePageState
    extends State<HomePage> {

  final TextEditingController
      cariController =
      TextEditingController();

  String keyword = '';

  @override
  Widget build(BuildContext context) {

    final bukuService =
        Provider.of<BukuService>(context);

    List<Buku> hasilCari =
        bukuService.daftarBuku.where((buku) {

      return buku.judul
          .toLowerCase()
          .contains(
            keyword.toLowerCase(),
          );

    }).toList();

    int totalBuku =
        bukuService.daftarBuku.length;

    int totalDipinjam =
        bukuService.daftarBuku
            .where(
              (buku) => buku.dipinjam,
            )
            .length;

    return Scaffold(

      appBar: AppBar(

        title: const Text(
          'Perpusku App',
        ),

        actions: [

          IconButton(

            onPressed: () {

              bukuService
                  .toggleDarkMode();
            },

            icon: const Icon(
              Icons.dark_mode,
            ),
          ),
        ],
      ),

      body: Column(

        children: [

          Padding(

            padding:
                const EdgeInsets.all(10),

            child: TextField(

              controller:
                  cariController,

              decoration: InputDecoration(

                hintText:
                    'Cari Buku',

                prefixIcon:
                    const Icon(
                  Icons.search,
                ),

                border:
                    OutlineInputBorder(

                  borderRadius:
                      BorderRadius.circular(
                    12,
                  ),
                ),
              ),

              onChanged: (value) {

                setState(() {

                  keyword = value;
                });
              },
            ),
          ),

          Padding(

            padding:
                const EdgeInsets.symmetric(
              horizontal: 10,
            ),

            child: Row(

              mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,

              children: [

                Text(
                  'Total Buku: $totalBuku',
                ),

                Text(
                  'Dipinjam: $totalDipinjam',
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 10,
          ),

          Expanded(

            child: ListView.builder(

              itemCount:
                  hasilCari.length,

              itemBuilder:
                  (context, index) {

                final buku =
                    hasilCari[index];

                return Card(

                  margin:
                      const EdgeInsets.all(
                    10,
                  ),

                  child: ListTile(

                    leading: CircleAvatar(

                      backgroundImage:
                          NetworkImage(
                        buku.cover,
                      ),
                    ),

                    title: Text(
                      buku.judul,
                    ),

                    subtitle: Column(

                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start,

                      children: [

                        Text(
                          buku.penulis,
                        ),

                        Text(
                          buku.kategori,
                        ),

                        Text(

                          buku.dipinjam
                              ? 'Dipinjam'
                              : 'Tersedia',

                          style: TextStyle(

                            color:
                                buku.dipinjam
                                    ? Colors.red
                                    : Colors.green,
                          ),
                        ),
                      ],
                    ),

                    onTap: () {

                      Navigator.push(

                        context,

                        MaterialPageRoute(

                          builder:
                              (context) =>

                                  DetailBukuPage(
                            buku: buku,
                          ),
                        ),
                      );
                    },

                    trailing: Column(

                      children: [

                        IconButton(

                          onPressed: () {

                            bukuService
                                .favoritBuku(
                                    index);
                          },

                          icon: Icon(

                            buku.favorit
                                ? Icons.favorite
                                : Icons
                                    .favorite_border,

                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton:
          FloatingActionButton(

        child:
            const Icon(Icons.add),

        onPressed: () {

          Navigator.push(

            context,

            MaterialPageRoute(

              builder: (context) =>

                  TambahBukuPage(),
            ),
          );
        },
      ),
    );
  }
}