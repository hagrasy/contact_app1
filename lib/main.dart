import 'package:contact_app1/firebase_options.dart';
import 'package:contact_app1/views/home.dart';
import 'package:contact_app1/views/login_page.dart';
import 'package:contact_app1/views/signup_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ContactApp());
}

class ContactApp extends StatelessWidget {
  const ContactApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            textTheme: GoogleFonts.soraTextTheme(),
            colorScheme:
                ColorScheme.fromSeed(seedColor: Colors.orange.shade800),
            useMaterial3: true,
          ),
          routes: {
            "/": (context) => LoginPage(),
            "/signup": (context) => SignUpPage(),
            "/login": (context) => LoginPage(),
            "/home": (context) => const Home(),
          }),
    );
  }
}
