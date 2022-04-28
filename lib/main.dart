import 'package:flutter/material.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title:  const Text(
            "Vücut Kitle İndeksi Hesaplama",
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18)
          ),
          centerTitle: true,
        ),
        body: const Body(),
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  double sonuc = 0.00;
  String txt = "";

  final boy = TextEditingController();

  final kilo = TextEditingController();

  void hesapla() {
    setState(() {
      sonuc = double.parse(kilo.text) /
          (double.parse(boy.text) * double.parse(boy.text));
    });
    if (sonuc < 20.7) {
      txt = "Zayıf, İdeal kilonun altında.";
    } else if (sonuc >= 20.7 && sonuc <= 26.4) {
      txt = "Normal, İdeal kilo.";
    } else if (sonuc > 26.5 && sonuc < 27.8) {
      txt = "Hafif kilolu.";
    } else if (sonuc > 27.9 && sonuc < 31.1) {
      txt = "Kilolu, Risk grubuna girebilir.";
    } else if (sonuc > 31.2 && sonuc < 44.8) {
      txt = "Obez, Aşırı kilolu.";
    } else if (sonuc > 44.9) {
      txt = "Çok riskli, Aşırı obez";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.05,vertical: MediaQuery.of(context).size.height * 0.02), 
              child: TextField(
                controller: boy,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  hintText: "Boy (m)",
                  hintStyle: TextStyle(
                      color: Colors.grey.shade500, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.05,vertical: MediaQuery.of(context).size.height * 0.02), 
              child: TextField(
                controller: kilo,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  hintText: "Kilo (kg)",
                  hintStyle: TextStyle(
                      color: Colors.grey.shade500, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Text(sonuc.toString()),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            ElevatedButton(
              onPressed: () {
                hesapla();
              },
              child: const Text("Hesapla",style: TextStyle(color: Colors.black),),
              style: ElevatedButton.styleFrom(
            primary: Colors.blueGrey.shade300,
          ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Text(txt),
          ],
        ),
      ),
    );
  }
}
