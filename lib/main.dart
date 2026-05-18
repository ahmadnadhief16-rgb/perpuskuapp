import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';
import 'services/buku_service.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => BukuService(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final bukuService =
        Provider.of<BukuService>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: bukuService.isDarkMode
          ? ThemeData.dark()
          : ThemeData.light(),

      home: const HomePage(),
    );
  }
}