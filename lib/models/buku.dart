class Buku {

  String judul;
  String penulis;
  String kategori;
  String cover;

  bool dipinjam;
  bool favorit;

  Buku({
    required this.judul,
    required this.penulis,
    required this.kategori,
    required this.cover,
    this.dipinjam = false,
    this.favorit = false,
  });
}