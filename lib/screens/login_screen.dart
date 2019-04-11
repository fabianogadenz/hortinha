
import 'package:flutter/material.dart';
import 'package:hortinha/screens/home_screen.dart';

import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController senhaController = new TextEditingController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _isLoading = false;

  var fundoImagem = new AssetImage('assets/fundo.jpg');
  var logoImagem = new AssetImage('assets/logo.jpg');


  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(
        new SnackBar(
          backgroundColor: Theme.of(context).splashColor,
          content: new Text(text,textAlign: TextAlign.center,),
          duration: Duration(seconds: 4),));
  }


  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
        ),
        child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: screenSize.height,
              ),
              child: Container(
                decoration: new BoxDecoration(
                    gradient: new LinearGradient(
                      colors: <Color>[
                        const Color.fromRGBO(0, 0, 0, 0.5),
                        const Color.fromRGBO(0, 0, 0, 0.1),
//                      const Color.fromRGBO(15, 104, 40, 0.5),
//                      const Color.fromRGBO(60, 185, 60, 0.5),
                      ],
                      stops: [0.2, 1.0],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(0.0, 1.0),
                    )),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        width: 280.0,
                        height: 280.0,
                        alignment: Alignment.center,
                        child: Icon(FontAwesome.getIconData("leaf"), size: 240.0, color: Colors.green,)
                      ),
                      new Form(
                          child: new Column(children: <Widget>[
                            new Container(
                              padding: EdgeInsets.all(10.0),
                              child: new Container(
                                decoration: new BoxDecoration(
                                  border: new Border(
                                    bottom: new BorderSide(
                                      width: 0.8,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                                child: new TextField(
                                  controller: emailController,
                                  //initialValue: "teste@hotmail.com",
                                  obscureText: false,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                  ),
                                  decoration: new InputDecoration(
                                    icon: new Icon(
                                      Icons.person_outline,
                                      color: Colors.green,
                                    ),
                                    border: InputBorder.none,
                                    hintText: "Usuário",
                                    hintStyle: const TextStyle(
                                        color: Colors.white, fontSize: 18.0),
                                    contentPadding: const EdgeInsets.only(
                                        top: 30.0,
                                        right: 30.0,
                                        bottom: 30.0,
                                        left: 5.0),
                                  ),
                                ),
                              ),
                            ),
                            new Container(
                              padding: EdgeInsets.all(10.0),
                              child: new Container(
                                decoration: new BoxDecoration(
                                  border: new Border(
                                    bottom: new BorderSide(
                                      width: 0.8,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                                child: new TextField(
                                  controller: senhaController,
                                  obscureText: true,

                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                  ),
                                  decoration: new InputDecoration(
                                    icon: new Icon(
                                      Icons.lock,
                                      color: Colors.green,
                                    ),
                                    border: InputBorder.none,
                                    hintText: "Senha",
                                    hintStyle: const TextStyle(
                                        color: Colors.white, fontSize: 18.0),
                                    contentPadding: const EdgeInsets.only(
                                        top: 30.0,
                                        right: 30.0,
                                        bottom: 30.0,
                                        left: 5.0),
                                  ),
                                ),
                              ),
                            ),
                            _isLoading ? new Theme(data: ThemeData(accentColor: Theme.of(context).splashColor), child: CircularProgressIndicator()) :
                            new Container(
                              margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                              child: new MaterialButton(
                                minWidth: 200.0,
                                height: 46.0,
                                onPressed: () {
                                  setState(() => _isLoading = true);
                                },
                                color: Colors.white,
                                child: Text('Login'),
                              ),
                            ),
                          ]))
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }


  @override
  void onLoginError(String errorTxt) {
    _showSnackBar(errorTxt);
    setState(() => _isLoading = false);
  }

  @override
  void onLoginSuccess() async {
    setState(() => _isLoading = false);
    Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => new HomeScreen()));
  }

}
