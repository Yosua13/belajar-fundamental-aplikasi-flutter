import 'package:flutter/material.dart';
import 'package:training/1_fundamental_flutter/5_interaction/listener_example.dart';
 
class ListenerScreen extends StatelessWidget {
 const ListenerScreen({super.key});
 
 @override
 Widget build(BuildContext context) {
   return const  Scaffold(
     body: Center(
       child: ListenerExample(),
     ),
   );
 }
}