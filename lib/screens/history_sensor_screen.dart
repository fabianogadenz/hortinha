import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HistorySensorsScreen extends StatefulWidget {
  @override
  _HistorySensorsScreenState createState() => _HistorySensorsScreenState();
}

class _HistorySensorsScreenState extends State<HistorySensorsScreen> {
  final List<int> items = [1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Histórico do Sensor"),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            onTapItem();
          },
          icon: Icon(Icons.invert_colors),
          label: Text("Ligar"),

        ),
        body:
        
        Container(
            child: Column(children: <Widget>[
          Expanded(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 0, 8, 0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final int item = items[index];

                    return ListTile(
                      leading: Icon(MdiIcons.waterPercent, size: 40,),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Sersor X",
                            style: TextStyle(fontSize: 15.0),
                          ),
                          Text(
                            "55%",
                            style: TextStyle(fontSize: 15.0),
                          )
                        ],
                      ),
                      subtitle: Text(
                        "14:23:00 - 06/12/2018",
                        style: TextStyle(fontSize: 12.0),
                      ),
                    );
                  },
                )),
          ),
        ]))
    );
  }
  void onTapItem() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(

          title: new Text("Alerta", style: TextStyle(fontSize: 17.0),),
          content: Text("Deseja ligar/desligar o aspersor responsavel por este sensor??"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Sim", ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
