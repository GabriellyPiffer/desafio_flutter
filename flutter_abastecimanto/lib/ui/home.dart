import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/abastecimento.dart';
import 'modal_edicao.dart';
import 'grafico.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Abastecimento> lista = [];

  static const Color rosa = Color(0xFFE91E63);

  @override
  void initState() {
    super.initState();
    carregar();
  }

  Future<void> carregar() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('abastecimentos');

    if (data != null) {
      final decoded = jsonDecode(data) as List;
      lista = decoded.map((e) => Abastecimento.fromJson(e)).toList();
    }

    setState(() {});
  }

  Future<void> salvar() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = lista.map((e) => e.toJson()).toList();

    await prefs.setString('abastecimentos', jsonEncode(jsonList));
  }

  double get precoMedio => lista.isEmpty
      ? 0
      : lista.map((e) => e.valorPago / e.litros).reduce((a, b) => a + b) /
            lista.length;

  double get consumoMedio {
    if (lista.length < 2) return 0;

    double total = 0;

    for (int i = 1; i < lista.length; i++) {
      total +=
          (lista[i].quilometragem - lista[i - 1].quilometragem) /
          lista[i].litros;
    }

    return total / (lista.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),

      appBar: AppBar(
        backgroundColor: rosa,
        title: const Text(
          'Abastecimento de Veículos',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),

            child: Card(
              color: const Color(0xFF1E1E1E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(color: rosa, width: 1),
              ),

              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.local_gas_station, color: rosa),
                        const SizedBox(width: 8),
                        Text(
                          'Resumo',
                          style: const TextStyle(
                            color: rosa,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    Text(
                      '💰 Preço médio: R\$ '
                      '${precoMedio.toStringAsFixed(2)}\n'
                      '🚗 Consumo médio: '
                      '${consumoMedio.toStringAsFixed(2)} km/L',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: lista.length,

              itemBuilder: (context, i) {
                final item = lista[i];

                return Card(
                  color: const Color(0xFF1E1E1E),

                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: rosa.withAlpha(77)),
                  ),

                  child: ListTile(
                    leading: const Icon(Icons.local_gas_station, color: rosa),

                    title: Text(
                      '${item.data} - ${item.combustivel}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    subtitle: Text(
                      '${item.litros} L - R\$ ${item.valorPago}',
                      style: const TextStyle(color: Colors.white70),
                    ),

                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: rosa),

                      onPressed: () {
                        lista.removeAt(i);
                        salvar();
                        setState(() {});
                      },
                    ),

                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => ModalEdicao(
                          abastecimento: item,
                          onSave: (novo) {
                            lista[i] = novo;
                            salvar();
                            setState(() {});
                          },
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),

          SizedBox(
            height: 200,

            child: GraficoAbastecimentos(
              valores: lista.map((e) => e.valorPago / e.litros).toList(),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: rosa,

        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => ModalEdicao(
              onSave: (novo) {
                lista.add(novo);
                salvar();
                setState(() {});
              },
            ),
          );
        },

        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
