class RegistroAgua {
  String data;
  double quantidadeMl;
  double pesoKg;

  RegistroAgua({
    required this.data,
    required this.quantidadeMl,
    required this.pesoKg,
  });

  Map<String, dynamic> toJson() => {
    'data': data,
    'quantidadeMl': quantidadeMl,
    'pesoKg': pesoKg,
  };

  factory RegistroAgua.fromJson(Map<String, dynamic> json) => RegistroAgua(
    data: json['data'] as String,
    quantidadeMl: (json['quantidadeMl'] as num).toDouble(),
    pesoKg: (json['pesoKg'] as num).toDouble(),
  );
}
