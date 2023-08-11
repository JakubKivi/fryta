import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BetInfo extends StatelessWidget {

  final bool loggedAs;  
  final bool winner;
  final String name;
  final DateTime date;
  final int number;

  BetInfo({
    required this.loggedAs,
    required this.winner,
    required this.name,
    required this.date,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    
    Color backgroundColor;
    IconData formattedIcon;

    if(loggedAs && winner) {
      backgroundColor = Theme.of(context).colorScheme.tertiaryContainer;
      formattedIcon = Icons.add;
    }else{
      backgroundColor = Theme.of(context).colorScheme.errorContainer;
      formattedIcon = Icons.remove;
    }
    String formattedDate = DateFormat('dd MMM yyyy').format(date);
    
    return Padding(
      padding: const EdgeInsets.all(4),
      child:Container(
        color: backgroundColor, 
        child: Row(
          children: [
            Icon(
              formattedIcon,
              size: 34,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).primaryTextTheme.labelLarge,
                  ),
                  Text(
                    formattedDate,
                    style: Theme.of(context).primaryTextTheme.labelMedium
                  )
                ]
              )
            ),
            const SizedBox(width: 16),
            Text(
                  number.toString(),
                  style: Theme.of(context).primaryTextTheme.titleLarge
                ),
          ],
        )
      )
    );
  }
}