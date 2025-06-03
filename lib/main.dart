import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String displaytext="No text data";
  TextEditingController textController= TextEditingController();
  List<String> tasklist=[];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home : Scaffold(
        appBar : AppBar(
          title : Text("To Do List"),
          backgroundColor: Colors.blue,
          centerTitle: false,
        ),
        body: Column(
          children:[
             Row(
              children: [
                    Expanded(
                      child:Container(
                     padding: EdgeInsets.all(10),
                        child: TextField(
                          controller: textController,
                            decoration: InputDecoration(
                             border: OutlineInputBorder(),
                               label: Text("Enter a task"),
                          ),
                        ),
                    ),
                  ),
                   MaterialButton(
                     color: Colors.white,
                       height: 40,
                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            onPressed: () {
          
                             setState(() {
                                tasklist.add(textController.text);
                                textController.clear();
                              });
                            },
                             child : Text("Click"),
                     ),
               ],
              ),
            
                 Flexible(
                child: ListView.builder(
                  itemCount: tasklist.length,
                  itemBuilder:(context,index){
                    return   Row(children: [
                    Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                     child: Text(tasklist[index]),
                    ),
                  ),
                
                  MaterialButton(
                    child: Icon(
                    Icons.delete,
                    color :Colors.red),
                    onPressed: () {
                     setState((){
                       tasklist.removeAt(index);
                     });
                    },
                    ),
                    ]);
                  },
                  ),
              ),
           ],
        )),
      
    );
  }
}
