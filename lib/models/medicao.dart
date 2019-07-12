class MedicaoMaster {
  String sId;
  String controlador;
  String data;
  List<Medicao> medicao;

  MedicaoMaster({this.sId, this.controlador, this.data, this.medicao});

  MedicaoMaster.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    controlador = json['controlador'];
    data = json['data'];
    if (json['medicao'] != null) {
      medicao = new List<Medicao>();
      json['medicao'].forEach((v) {
        medicao.add(new Medicao.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['controlador'] = this.controlador;
    data['data'] = this.data;
    if (this.medicao != null) {
      data['medicao'] = this.medicao.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Medicao {
  String tipo;
  int valor;
  String sensor;
  String sId;

  Medicao({this.tipo, this.valor, this.sensor, this.sId});

  Medicao.fromJson(Map<String, dynamic> json) {
    tipo = json['tipo'];
    valor = json['valor'];
    sensor = json['sensor'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tipo'] = this.tipo;
    data['valor'] = this.valor;
    data['sensor'] = this.sensor;
    data['_id'] = this.sId;
    return data;
  }
}