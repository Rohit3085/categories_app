
import 'package:categories_app/pages/screen_B.dart';
import 'package:categories_app/pages/screen_C.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
class screen_A extends StatefulWidget {
  const screen_A({Key? key}) : super(key: key);

  @override
  _screen_AState createState() => _screen_AState();
}

class _screen_AState extends State<screen_A> {
  List _items = [];
  List parent =[1,2,6];
  List screenAlist = [];

  //Fetch content from the json file
  Future<void> readJson() async {
    _myCallback();
    final String response = await rootBundle.loadString('assets/data.json'); // error
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];

      //print("name:: ${_items['name']}");
    });
    // for(int i = 0;i<_items.length;i++){
    //   print("name is: ${_items[i]['name']}");
    // }
    for(int i = 0;i<_items.length;i++){
      if(_items[i]['id'] == 1 ||_items[i]['id'] == 2 ||_items[i]['id'] == 6 ){
        screenAlist.add(_items[i]);
      }
    }

  }
  //bool _canShowButton = true;

  // void hideWidget() {
  //   setState(() {
  //     _canShowButton = !_canShowButton;
  //   }
  //   );
  // }

  bool _isPressed = false;

  // This function is called when the button gets pressed
  void _myCallback() {
    setState(() {
      _isPressed = true;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
      //       ElevatedButton.icon(onPressed: (){
      //       Navigator.push(context,MaterialPageRoute(builder: (context) => const screen_B()));
      // }
      //       , icon: Icon(Icons.change_circle),
      //       label: Text("Click!")
      // ),

            ElevatedButton(
              onPressed: _isPressed == false? readJson : null,
              child: const Text('Load Data'),

            ),

            // Display the data loaded from sample.json
            _items.isNotEmpty
                ? Expanded(
              child: ListView.builder(
                itemCount: screenAlist.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      //print("tapped!!");
                      //Navigator.push(context,MaterialPageRoute(builder: (context) => const screen_B()));
                      if (screenAlist[index]["parent"] == 1 || screenAlist[index]["parent"] == 2||screenAlist[index]["parent"] == 6){
                        Navigator.push(context,MaterialPageRoute(builder: (context) => screen_B(data: screenAlist[index],)));
                      }
                      else{
                        Navigator.push(context,MaterialPageRoute(builder: (context) => const screen_C()));
                      }

                    },
                    child: Card(
                      key: ValueKey(screenAlist[index]["id"]),
                      margin: const EdgeInsets.all(10),
                      color: Colors.amber.shade100,
                      child: ListTile(
                        //leading: Text(screenAlist[index]["id"].toString()),
                        title: Text(screenAlist[index]["name"]),
                        subtitle: Text(screenAlist[index]["parent"].toString()),
                      ),
                    ),
                  );
                },
              ),
            )
                : Container(),

            //Image(image: AssetImage('assets/sharingancopy.jpg')),
          ]
            )
      )
      );

  }
}
