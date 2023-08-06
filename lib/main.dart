import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

int counter = 0; 
int toChange = 0;

const Color colorMainBgLeft = Colors.orange;
const Color colorMainBgRight = Colors.orangeAccent;
const Color colorAppBarBg = Colors.deepPurple;
const Color colorAppBarBgShadow = Colors.red;
const Color colorAppBar = Colors.deepOrange;
const Color colorAppBarTextShadow = Colors.red;

TextEditingController textController = TextEditingController();

int gender = -1; //1= baba -1= chopek

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const Fryta());
}

class Fryta extends StatelessWidget {
  
  const Fryta({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fryta',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true        
      ),
      home: const MyHomePage(title: 'Fryta'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  
  void _incrementCounter(int ile) {
    setState(() {
      String dataLiczba = (counter+ile).toString();
      final data = <String, String>{
        "Liczba": dataLiczba
      };
      firestore.collection("Frytki").doc("Frytki").set(data).onError((e, _)=>print("error"));
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: 
        const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft ,
            end: Alignment.centerRight,
            colors: [colorMainBgLeft, colorMainBgRight]
          )
        ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: colorAppBarBg,
          shadowColor: colorAppBarBgShadow,
          elevation: 5,
          title: Text(widget.title),
          titleTextStyle: const TextStyle(
            color:  colorAppBar,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(0, 0),
                blurRadius: 5.0,
                color: colorAppBarTextShadow
              )],
            fontSize: 26.0
          )
        ),
        body: 
        
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft ,
                    end: Alignment.centerRight,
                    colors: [Color(0xFF110505), Color(0xFF331111)]
                  )
                ),
                child: SizedBox(
                  width: 200,
                  child: TextField(
                    controller: textController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      
                      filled: true,
                      fillColor: Colors.transparent,
                      hintText: 'Podaj liczbe zakładu',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      
                    ),
                  )
                ),
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xffd39b0f),
                              Color(0xfff5c754),
                              Color(0xffffde8b),
                            ],
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: const Color.fromARGB(255, 148, 244, 221),
                        padding: const EdgeInsets.all(10.0),
                        textStyle: const TextStyle(fontSize: 30),
                      ),
                      onPressed: ()=>_incrementCounter(int.parse(textController.text)),
                      child: const Text('Chopek wygrał zakład'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xffd39b0f),
                              Color(0xfff5c754),
                              Color(0xffffde8b),
                            ],
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: const Color.fromARGB(255, 148, 244, 221),
                        padding: const EdgeInsets.all(10.0),
                        textStyle: const TextStyle(fontSize: 30),
                      ),
                      onPressed: ()=>_incrementCounter(-int.parse(textController.text)),
                      child: const Text('Baba wygrała zakład'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const TextChanger(),
              
              
              // Text(
              //   '$counter',
              //   style: Theme.of(context).textTheme.headlineLarge ,
              // ),
              
              // GetFryty("Frytki"),
              // CheckFryty()
                
            ],
          ),
        ),
        
        // This trailing comma makes auto-formatting nicer for build methods.
      )
    );
  }
}

class TextChanger extends StatefulWidget {
  const TextChanger({super.key});
  @override
  State<TextChanger> createState() => _TextChangerState();
}
class _TextChangerState extends State<TextChanger> {
  // Declare the variable
  String dynamicText = 'Chopek wisi tyle frytek';
  updateText() {
    setState(() {
      if(gender==-1){
        dynamicText = 'Baba wisi tyle frytek';
        gender=1;
      }else{
        dynamicText = 'Chopek wisi tyle frytek';
        gender=-1;
      }
      
      // Replace with your logic
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          dynamicText, // Dynamic text
          style: const TextStyle(fontSize: 28),
        ),
        Image.asset(
              'assets/fry.png',
              height: 200,
              width: 500),
        contFrytki(),
        ElevatedButton(
          child: const Text('Zmień płeć'),
          onPressed: () => updateText(), // Call the method
        ),
      ],
    );
  }
}

class contFrytki extends StatefulWidget {
  @override
  _contFrytkiState createState() => _contFrytkiState();
}

class _contFrytkiState extends State<contFrytki> {
  final Stream<QuerySnapshot> _frytki =
      FirebaseFirestore.instance.collection('Frytki').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _frytki,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }
        
        String a = {snapshot.data!.docs
              .map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return data['Liczba'];
              }).toString()}.join();
        
        counter= int.parse(a.split("(").removeLast().split(")").removeAt(0));

        return Text((int.parse({snapshot.data!.docs
              .map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return data['Liczba'];
              })}.toString().split("{(").removeLast().split(")}").removeAt(0))*gender).toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
                fontSize: 70
                ),
              );
      },
    );
  }
}

class GetFryty extends StatelessWidget {
  final String documentId;

  GetFryty(this.documentId);
  
  @override
  Widget build(BuildContext context) {
    CollectionReference frytki = FirebaseFirestore.instance.collection('Frytki');
    return FutureBuilder<DocumentSnapshot>(
      future: frytki.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return Text("Liczba: ${data['Liczba']} ");
        }

        return const Text("loading");
      },
    );
  }
}

class CheckFryty extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return const Text("Error");
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return const Text("G");
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return const Text("Loading");
      },
    );
  }
}