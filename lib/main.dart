import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

int counter = 0; 
int toChange = 0;

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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fryta',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromARGB(255, 148, 244, 221)
      ),
      home: const MyHomePage(title: 'Fryta'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // var db = FirebaseFirestore.instance;
  
  void _incrementCounter(int ile) {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      
      // counter = GetFryty("Frytki");
      String data_liczba = (counter+ile).toString();
      final data = <String, String>{
        "Liczba": data_liczba
      };
      firestore.collection("Frytki").doc("Frytki").set(data).onError((e, _)=>print("error"));
      // firestore.collection("Frytki").doc("Frytki").set

    });
    
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: 
      
      Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: textController,
              
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                
                filled: true,
                fillColor: Color(0xfff5c754),
                hintText: 'Podaj liczbe zakładu',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                
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
              'assets/fry.jpg',
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