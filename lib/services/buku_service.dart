import 'package:flutter/material.dart';
import '../models/buku.dart';

class BukuService extends ChangeNotifier {

  final List<Buku> daftarBuku = [];

  bool isDarkMode = false; // 👈 WAJIB INI

  void toggleDarkMode() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }

  void tambahBuku(Buku buku) {
    daftarBuku.add(buku);
    notifyListeners();
  }

  void hapusBuku(int index) {
    daftarBuku.removeAt(index);
    notifyListeners();
  }

  void pinjamBuku(int index) {
    daftarBuku[index].dipinjam = true;
    notifyListeners();
  }

  void kembalikanBuku(int index) {
    daftarBuku[index].dipinjam = false;
    notifyListeners();
  }

  void favoritBuku(int index) {
    daftarBuku[index].favorit =
        !daftarBuku[index].favorit;
    notifyListeners();
  }
}