import 'package:flutter/material.dart';

class ExpandedWidget extends StatelessWidget {
 const ExpandedWidget({
   super.key,
 });
 
 @override
 Widget build(BuildContext context) {
   return Expanded(
     child: Container(
       decoration: BoxDecoration(
         color: Colors.yellow,
         border: Border.all(color: Colors.black, width: 1),
       ),
       padding: const EdgeInsets.all(8),
       child: const Text(
         'Expanded',
         style: TextStyle(fontSize: 30),
       ),
     ),
   );
 }
}