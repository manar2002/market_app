import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String email ="";
  getCachedEmail()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {

    });
  }
  @override
  void initState(){
    super.initState();
    getCachedEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("page1 \n $email"),
    );
  }
}
