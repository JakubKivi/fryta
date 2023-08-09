import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

int counter = 0; 
int toChange = 0;


TextEditingController textController = TextEditingController();

int gender = -1; //1= baba -1= chopek

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(widget.title)
          
        ),
        body: 
        
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
                TextField(
                    controller: textController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Podaj liczbe zakładu',
                      
                    ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: ()=>_incrementCounter(int.parse(textController.text)),
                child: const Text('Chopek wygrał zakład'),
              ),
              
              const SizedBox(height: 10),
              TextButton(
                onPressed: ()=>_incrementCounter(-int.parse(textController.text)),
                child: const Text('Baba wygrała zakład'),
              ),
                  
              const SizedBox(height: 20),
              const TextChanger(),
                
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
          style: Theme.of(context).primaryTextTheme.headlineMedium,
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
              style: Theme.of(context).textTheme.headlineLarge,
              );
      },
    );
  }
}
