class Abastecimento {
  String data;
  String combustivel;
  double litros;
  double valorPago;
  double quilometragem;

  Abastecimento({
    required this.data,
    required this.combustivel,
    required this.litros,
    required this.valorPago,
    required this.quilometragem,
  });

  Map<String, dynamic> toJson() => {
    'data': data,
    'combustivel': combustivel,
    'litros': litros,
    'valorPago': valorPago,
    'quilometragem': quilometragem,
  };

  factory Abastecimento.fromJson(Map<String, dynamic> json) => Abastecimento(
    data: json['data'],
    combustivel: json['combustivel'],
    litros: json['litros'],
    valorPago: json['valorPago'],
    quilometragem: json['quilometragem'],
  );
}
