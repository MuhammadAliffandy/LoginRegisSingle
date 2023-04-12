import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic result = '';

  TextEditingController tinggiValue = TextEditingController();
  TextEditingController beratValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String username = args['username'];

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 32, 33),
      body: SingleChildScrollView(
          child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // head line
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0),
                ),
                color: Color.fromARGB(255, 19, 19, 19),
              ),
              height: 350,
              width: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Halo ${username}',
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
                    'Selamat melakukan pengecekan BMI',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: 330,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(61, 83, 83, 83),
                    ),
                    child: Center(
                      child: Text(
                        'Hasil BMI : ${result}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            // input field bmi
// ===============================================================================
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: tinggiValue,
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
                        labelText: 'Tinggi Badan',
                        labelStyle: TextStyle(color: Color.fromARGB(112, 255, 255, 255)),
                        floatingLabelStyle: TextStyle(color: Colors.amber),
                        hintText: 'Masukkan Tinggi Badan',
                        hintStyle: TextStyle(color: Color.fromARGB(112, 255, 255, 255)),
                      ),
                    ),
                  ),

// ===============================================================================

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: beratValue,
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
                          labelText: 'Berat Badan',
                          labelStyle: TextStyle(color: Color.fromARGB(112, 255, 255, 255)),
                          floatingLabelStyle: TextStyle(color: Colors.amber),
                          hintText: 'Masukkan Berat Badan',
                          hintStyle: TextStyle(color: Color.fromARGB(112, 255, 255, 255))),
                    ),
                  ),

                  // button sign in
// ===============================================================================

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: ElevatedButton(
                      onPressed: () {
                        final int berat = int.tryParse(beratValue.text) ?? 0;
                        final int tinggi = int.tryParse(tinggiValue.text) ?? 0;
                        dynamic hasil = (berat / (tinggi * tinggi)) * 730;

                        setState(() {
                          result = hasil;
                        });
                      },
                      child: Text('Hitung'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.amber),
                        minimumSize: MaterialStateProperty.all(Size(370, 60)),
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

                  Container(
                      width: 350,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(context, '/register', ModalRoute.withName('/register'));
                        },
                        child: Text(
                          'Log out',
                          style: TextStyle(color: Colors.amber),
                        ),
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(0, 0)),
                        ),
                      )),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
