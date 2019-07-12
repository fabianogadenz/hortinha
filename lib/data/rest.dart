import 'dart:convert';

import 'package:hortinha/models/controlador.dart';
import 'package:hortinha/models/medicao.dart';
import 'package:hortinha/models/sensor.dart';
import 'package:http/http.dart' as http;


class RestData{
  static final BASE_URL = "http://horta.md.utfpr.edu.br/api";
  static final CONTROLADOR_URL = BASE_URL + "/controlador/";
  static final MEDICAO_URL = BASE_URL + "/medicao/";
  static final SENSOR_URL = BASE_URL + "/sensor/";


  Future<List<Controlador>> buscaControladores() async {
    List<Controlador> listControlador = [];
    try {
      http.Response response = await http.get(CONTROLADOR_URL);
      var jsonData = json.decode(response.body);
      for (var u in jsonData) {
        listControlador.add(new Controlador.fromJson(u));
      }
      return listControlador;
    } on Exception catch (_) {}
  }

  Future<List<Medicao>> buscaMedicoes() async {
    List<Medicao> listMedicao = [];
    try {
      http.Response response = await http.get(MEDICAO_URL);
      var jsonData = json.decode(response.body);
      for (var u in jsonData) {
        listMedicao.add(new Medicao.fromJson(u));
      }
      return listMedicao;
    } on Exception catch (_) {}
  }

  Future<List<Sensor>> buscaSensor() async {
    List<Sensor> listSensor = [];
    try {
      http.Response response = await http.get(SENSOR_URL);
      var jsonData = json.decode(response.body);
      for (var u in jsonData) {
        listSensor.add(new Sensor.fromJson(u));
      }
      return listSensor;
    } on Exception catch (_) {}
  }



}