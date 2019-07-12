class Sensor {
  String sId;
  String macControlador;
  int codigo;
  String tipo;

  Sensor({this.sId, this.macControlador, this.codigo, this.tipo});

  Sensor.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    macControlador = json['macControlador'];
    codigo = json['codigo'];
    tipo = json['tipo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['macControlador'] = this.macControlador;
    data['codigo'] = this.codigo;
    data['tipo'] = this.tipo;
    return data;
  }
}