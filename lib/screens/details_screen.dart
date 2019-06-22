import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final List<int> items = [1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Detalhe do Canteiro"),
          actions: <Widget>[

            Padding(
              padding: EdgeInsets.only(right: 15),
              child: IconButton(icon: Icon(Icons.location_on), onPressed: (){
                onTapItem();
              }),
            ),
          ],
        ),
        body: Container(
            child: Column(children: <Widget>[
//          Padding(
//            padding: const EdgeInsets.fromLTRB(0, 25, 0, 20),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Text(
//                  "SITUAÇÃO DO CANTEIRO",
//                  style: TextStyle(color: Colors.black),
//                )
//              ],
//            ),
//          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 0, 8, 0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final int item = items[index];

                    return ListTile(
                      leading: Icon(
                        MdiIcons.waterPercent,
                        size: 40,
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[Text("Sersor X"), Text("35%")],
                      ),
                      subtitle: Text("14:23:00 - 06/12/2018"),
                    );
                  },
                )),
          ),
        ])));
  }


  void onTapItem() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(

          title: new Text("Alerta", style: TextStyle(fontSize: 17.0),),
          content: Text("Deseja informar a localização atual do canteiro?"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Sim", ),
              onPressed: () {},
            ),
          ],
        );
      },
    );
  }
}
