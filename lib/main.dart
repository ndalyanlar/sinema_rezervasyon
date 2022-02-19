import 'package:flutter/material.dart';
import 'package:sinema_rezervasyon/design/cinema_home_page.dart';
import 'package:sinema_rezervasyon/design/profile_page.dart';

const Color bgColor = Color(0xFFf4f7ff);
void main() {
  runApp(MaterialApp(
    home: const ProfilePage(),
    theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: bgColor, elevation: 0),
        iconTheme: const IconThemeData(color: Colors.black)),
  ));
}
