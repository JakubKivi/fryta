import 'package:flutter/material.dart';
import 'package:fryta/screens/bet_create.dart';
import 'package:fryta/screens/bet_list.dart';
import 'package:fryta/screens/old_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(widget.title)
          
        ),
        body: 
          const Center(
            child: Text("New Homepage"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => BetCreate()));
          },
          child: const Icon(Icons.add),
        ),
        drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              child: Text(
                'Fryta',
              ),
            ),
            ListTile(
              title: const Text('Bets'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => BetList()));
              },
            ),
            ListTile(
              title: const Text('OldScreen'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const OldScreen()));
              },
            )
          ],
        ),
      ),
        // This trailing comma makes auto-formatting nicer for build methods.
      );
  }
}