
import 'package:categories_app/pages/screen_C.dart';
import 'package:flutter/material.dart';
import 'package:categories_app/pages/screen_A.dart';
class screen_B extends StatefulWidget {
  List data;
  screen_B({Key? key,required this.data}) : super(key: key);

  @override
  State<screen_B> createState() => _screen_BState(this.data);
}

class _screen_BState extends State<screen_B> {
  List res = [];

  _screen_BState(this.res);
  print(res) {
    // TODO: implement print
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text(res.toString()),

            // ElevatedButton(onPressed: (){
            //   Navigator.push(context, MaterialPageRoute(builder: (context) => const screen_C()));
            // }, child: Text("Screen B"))





        ),
      );

  }
}