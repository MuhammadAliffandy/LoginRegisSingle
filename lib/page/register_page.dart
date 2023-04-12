import 'package:flutter/material.dart';
import 'package:kelompok_1/page/login_page.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  TextEditingController usernameValue = TextEditingController();
  TextEditingController emailValue = TextEditingController();
  TextEditingController passValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 32, 33),
      body: SingleChildScrollView(
          child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // input field email & passs
            Card(
              margin: EdgeInsets.all(20),
              color: Color.fromARGB(255, 19, 19, 19),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // head line
                    Container(
                      width: 350,
                      child: Column(
                        children: [
                          Text(
                            'Create Account!',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Silahkan buat akun untuk lanjut',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 50,
                    ),

// ===============================================================================
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                      child: TextField(
                        controller: usernameValue,
                        style: TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(117, 83, 81, 81),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          labelText: 'Username',
                          labelStyle: TextStyle(color: Color.fromARGB(112, 255, 255, 255)),
                          floatingLabelStyle: TextStyle(color: Colors.amber),
                          hintText: 'Masukkan Username',
                          hintStyle: TextStyle(color: Color.fromARGB(112, 255, 255, 255)),
                        ),
                      ),
                    ),
// ===============================================================================
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                      child: TextField(
                        controller: emailValue,
                        style: TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(117, 83, 81, 81),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Color.fromARGB(112, 255, 255, 255)),
                          floatingLabelStyle: TextStyle(color: Colors.amber),
                          hintText: 'Masukkan Email',
                          hintStyle: TextStyle(color: Color.fromARGB(112, 255, 255, 255)),
                        ),
                      ),
                    ),

// ===============================================================================

                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                      child: TextField(
                        controller: passValue,
                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(117, 83, 81, 81),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.amber),
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Color.fromARGB(112, 255, 255, 255)),
                            floatingLabelStyle: TextStyle(color: Colors.amber),
                            hintText: 'Masukkan Password',
                            hintStyle: TextStyle(color: Color.fromARGB(112, 255, 255, 255))),
                      ),
                    ),

                    // button sign in
// ===============================================================================

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: ElevatedButton(
                        onPressed: () {
                          final Map<String, dynamic> arguments = {
                            'username': usernameValue.text,
                            'email': emailValue.text,
                            'password': passValue.text
                          };

                          Navigator.pushNamed(context, '/login', arguments: arguments);
                        },
                        child: Text('Sign Up'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.amber),
                          minimumSize: MaterialStateProperty.all(Size(335, 60)),
                          padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 16),
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ),

// ===============================================================================
                    // button sign up

                    Container(
                      width: 350,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Sudah Punya Akun?', style: TextStyle(color: Color.fromARGB(112, 255, 255, 255))),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(context, '/login', ModalRoute.withName('/register'));
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(color: Colors.amber),
                            ),
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(Size(0, 0)),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
