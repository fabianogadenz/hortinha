import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Image.network("https://www.caldasnovas.go.gov.br/wp-content/uploads/2018/08/Departamento-de-Educa%C3%A7%C3%A3o-Socioambiental-ter%C3%A1-horta-org%C3%A2nica-Foto-Marcia-Nunes.3pg-960x480.jpg", fit: BoxFit.fill,),
              title: Text("Detalhes do sensor X"),
            ),
          ),



        ],
        
      ),
    );
  }
}
