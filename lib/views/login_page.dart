import 'package:contact_app1/controllers/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                validator: (value) =>
                    value!.isEmpty ? "Email cannot be empty." : null,
                controller: emailController,
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
                validator: (value) => value!.length < 8
                    ? "Password should have at least 8 characters"
                    : null,
                controller: passwordController,
                obscureText: true,
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
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      AuthService()
                          .loginWithEmail(
                              emailController.text, passwordController.text)
                          .then((value) {
                        if (value == "Logged in Successfully") {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text("Logged in Successfully"),
                            backgroundColor: Colors.green.shade400,
                          ));
                          Navigator.pushReplacementNamed(context, "/home");
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              value,
                              style: const TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.red.shade400,
                          ));
                        }
                      });
                    }
                  },
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
                onPressed: () {
                  AuthService().continueWithGoogle().then((value) {

if(value == "Google Login Successful"){
ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text("Google account logged in successfully"),
                            backgroundColor: Colors.green.shade400,
                          ));
                          Navigator.pushReplacementNamed(context, "/home");

}
else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              value,
                              style: const TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.red.shade400,
                          ));
                        } 

                  });
                },
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
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/signup");
                  },
                  child: const Text("Sign Up"))
            ],
          ),
        ]),
      ),
    );
  }
}
