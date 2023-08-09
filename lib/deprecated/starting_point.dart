
// class GetFryty extends StatelessWidget {
//   final String documentId;

//   GetFryty(this.documentId);
  
//   @override
//   Widget build(BuildContext context) {
//     CollectionReference frytki = FirebaseFirestore.instance.collection('Frytki');
//     return FutureBuilder<DocumentSnapshot>(
//       future: frytki.doc(documentId).get(),
//       builder:
//           (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

//         if (snapshot.hasError) {
//           return const Text("Something went wrong");
//         }

//         if (snapshot.hasData && !snapshot.data!.exists) {
//           return const Text("Document does not exist");
//         }

//         if (snapshot.connectionState == ConnectionState.done) {
//           Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
//           return Text("Liczba: ${data['Liczba']} ");
//         }

//         return const Text("loading");
//       },
//     );
//   }
// }

// class CheckFryty extends StatelessWidget {  
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       // Initialize FlutterFire
//       future: Firebase.initializeApp(),
//       builder: (context, snapshot) {
//         // Check for errors
//         if (snapshot.hasError) {
//           return const Text("Error");
//         }

//         // Once complete, show your application
//         if (snapshot.connectionState == ConnectionState.done) {
//           return const Text("G");
//         }

//         // Otherwise, show something whilst waiting for initialization to complete
//         return const Text("Loading");
//       },
//     );
//   }
// }