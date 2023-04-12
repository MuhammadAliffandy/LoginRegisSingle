import 'package:flutter/material.dart';
import 'package:kelompok_1/page/register_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController emailValue = TextEditingController();
  TextEditingController passValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    var username = arguments?['username'];
    var email = arguments?['email'];
    var password = arguments?['password'];

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
                            'Welcome Back!',
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
                            'Silahkan Sign In untuk lanjut',
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
                        controller: emailValue,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
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
                        decoration: InputDecoration(
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
                          if (emailValue.text != email || passValue.text != password) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      'Sorry',
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Color.fromARGB(255, 189, 144, 6)),
                                      textAlign: TextAlign.center,
                                    ),
                                    content: Text(
                                      'Email atau password anda salah',
                                      textAlign: TextAlign.center,
                                    ),
                                    actions: [
                                      Center(
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all(Colors.amber),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('Okay'),
                                        ),
                                      )
                                    ],
                                  );
                                });
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      'Selamat',
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Color.fromARGB(255, 189, 144, 6)),
                                      textAlign: TextAlign.center,
                                    ),
                                    content: Text(
                                      'Anda berhasil Login',
                                      textAlign: TextAlign.center,
                                    ),
                                    actions: [
                                      Center(
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all(Colors.amber),
                                          ),
                                          onPressed: () {
                                            Navigator.pushNamed(context, '/home', arguments: {
                                              'username': username
                                            }).then((value) => {
                                                  if (value == true)
                                                    {
                                                      Navigator.of(context).pop()
                                                    }
                                                });
                                          },
                                          child: Text('Okay'),
                                        ),
                                      )
                                    ],
                                  );
                                });
                          }
                        },
                        child: Text('Sign in'),
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
                          Text('Belum Punya Akun?', style: TextStyle(color: Color.fromARGB(112, 255, 255, 255))),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(context, '/register', ModalRoute.withName('/login'));
                            },
                            child: Text(
                              'Sign Up',
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
