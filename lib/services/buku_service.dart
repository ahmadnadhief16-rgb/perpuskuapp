import 'package:flutter/material.dart';
import '../models/buku.dart';

class BukuService extends ChangeNotifier {
  final List<Buku> _daftarBuku = [];

  List<Buku> get daftarBuku => _daftarBuku;

  void tambahBuku(Buku buku) {
    _daftarBuku.add(buku);
    notifyListeners();
  }

  void hapusBuku(int index) {
    _daftarBuku.removeAt(index);
    notifyListeners();
  }
}