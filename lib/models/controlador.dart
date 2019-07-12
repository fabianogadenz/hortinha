class Controlador {
  String sId;
  String mac;
  String descricao;
  List<Sensores> sensores;

  Controlador({this.sId, this.mac, this.descricao, this.sensores});

  Controlador.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    mac = json['mac'];
    descricao = json['descricao'];
    if (json['sensores'] != null) {
      sensores = new List<Sensores>();
      json['sensores'].forEach((v) {
        sensores.add(new Sensores.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['mac'] = this.mac;
    data['descricao'] = this.descricao;
    if (this.sensores != null) {
      data['sensores'] = this.sensores.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sensores {
  String codigo;
  String sensor;
  String sId;

  Sensores({this.codigo, this.sensor, this.sId});

  Sensores.fromJson(Map<String, dynamic> json) {
    codigo = json['codigo'];
    sensor = json['sensor'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codigo'] = this.codigo;
    data['sensor'] = this.sensor;
    data['_id'] = this.sId;
    return data;
  }
}