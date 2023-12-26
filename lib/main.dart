import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';

void main() async {
  var initialRoute = await Routes.initialRoute;
  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;

  const Main(this.initialRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      getPages: Nav.routes,
      theme: ThemeData(
        textTheme: GoogleFonts.notoSansAdlamTextTheme(
          ThemeData.dark().textTheme,
        ),
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal, brightness: Brightness.dark),
      ),
    );
  }
}
