import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sensores por Canteiro"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
        }, child: Icon(Icons.add),),
        body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Canteiro $index", style: TextStyle(fontSize: 25.0),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                   // physics: NeverScrollableScrollPhysics(),
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                    ),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.blue,
                        child: Center(child: Text("Sensor: $index")),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ));
  }
}
