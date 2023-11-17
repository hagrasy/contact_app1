import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          "Login",
          style: GoogleFonts.sora(fontSize: 36, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width * .9,
            child: TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Please enter email")),
            )),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width * .9,
            child: TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Please enter password")),
            )),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
            height: 60,
            width: MediaQuery.of(context).size.width * .9,
            child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ))),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 60,
          width: MediaQuery.of(context).size.width * .9,
          child: OutlinedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/google.png",
                    height: 30,
                    width: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Continue with Google",
                    style: TextStyle(fontSize: 16),
                  )
                ],
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Don't have an account?"),
            TextButton(onPressed: () {}, child: const Text("Sign Up"))
          ],
        ),
      ]),
    );
  }
}
