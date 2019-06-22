import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:hortinha/screens/details_screen.dart';
import 'package:hortinha/screens/history_sensor_screen.dart';
import 'package:hortinha/screens/login_screen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _addTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sensores por Canteiro"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => new LoginScreen()));
                })
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            onTapAdd();
          },
          child: Icon(Icons.add),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.grey, width: 2)),
                    width: double.infinity,
                    child: ExpansionTile(
                      title: Text("Estação Meteriológica"),
                      children: <Widget>[
                        LinhaTabela("Temperatura", "34", true),
                        LinhaTabela("Iluminação", "200", false),
                        LinhaTabela("Umidade do Ar", "45%", true),
                        LinhaTabela("Altitude", "200m", false),
                        LinhaTabela("Pressão", "40", true),
                      ],
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            child: Text(
                              "Canteiro $index",
                              style: TextStyle(fontSize: 25.0),
                            ),
                            onTap: () {
                              Navigator.push(context, new MaterialPageRoute(builder: (context) => new DetailsScreen()));
                            },
                          ),
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
                              return InkWell(
                                onTap: () {
                                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new HistorySensorsScreen()));
                                },
                                child: Container(
                                  color: (index != 2) ? Colors.green : Colors.red,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text("Sensor: $index"),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            MdiIcons.waterPercent,
                                            size: 20,
                                          ),
                                          Text("50%"),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "OFF",
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }

  Widget LinhaTabela(String nome, String conteudo, bool zebrado) {
    int zebradoCor = 255;
    if (zebrado) zebradoCor = 240;
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.all(8.0),
            decoration: new BoxDecoration(
              color: Color.fromRGBO(zebradoCor, zebradoCor, zebradoCor, 1.0),
              borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  nome,
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: Text(
                    conteudo,
                    style: TextStyle(fontSize: 15.0),
                    softWrap: false,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void onTapAdd() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Adicionado Canteiro'),
            content: TextField(
              controller: _addTextController,
              decoration: InputDecoration(hintText: "Digite o código"),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child: new Text(
                  'ADICIONAR',
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
