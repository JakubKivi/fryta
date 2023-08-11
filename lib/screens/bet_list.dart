import 'package:flutter/material.dart';
import 'package:fryta/screens/bet_create.dart';
import 'package:fryta/widgets/bet_info.dart';


class BetList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bet List'),
      ),
      body:  
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              BetInfo(
                loggedAs: true,
                winner: true,
                name: "Is it true",
                date: DateTime(2023, 12, 11),
                number: 69
              ),
              BetInfo(
                loggedAs: true,
                winner: false,
                name: "Who can drink less lore ipsum dolor sit amet i asd das sads asd",
                date: DateTime(2023, 3, 9),
                number: 31
              ),
              BetInfo(
                loggedAs: true,
                winner: true,
                name: "Who can drink more",
                date: DateTime(2022, 1, 31),
                number: 12
              ),
            ]
          ),


      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => BetCreate()));
          },
          child: const Icon(Icons.add),
        ),
    );
  }
}