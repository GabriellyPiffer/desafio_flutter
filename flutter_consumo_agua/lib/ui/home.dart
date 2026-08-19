import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'modal_registro.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> registros = [];

  final TextEditingController dataController = TextEditingController();
  final TextEditingController quantidadeController = TextEditingController();
  final TextEditingController pesoController = TextEditingController();

  // Azul escuro
  final Color azulEscuro = const Color(0xFF1565C0);

  void _abrirModal() {
    showDialog(
      context: context,
      builder: (_) => ModalRegistro(
        dataController: dataController,
        quantidadeController: quantidadeController,
        pesoController: pesoController,
        onSalvar: _salvarRegistro,
      ),
    );
  }

  void _salvarRegistro() {
    setState(() {
      registros.add({
        'data': dataController.text,
        'quantidade': quantidadeController.text,
        'peso': pesoController.text,
      });

      dataController.clear();
      quantidadeController.clear();
      pesoController.clear();
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(title: const Text('Bebi Água'), centerTitle: true),

      body: registros.isEmpty
          ? Center(
              child: Text(
                'Nenhum registro ainda',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Gráfico de consumo
                  SizedBox(
                    height: 200,
                    child: LineChart(
                      LineChartData(
                        gridData: FlGridData(show: false),
                        titlesData: FlTitlesData(show: false),
                        borderData: FlBorderData(show: false),
                        lineBarsData: [
                          LineChartBarData(
                            isCurved: true,

                            // AZUL ESCURO
                            color: azulEscuro,

                            barWidth: 4,
                            spots: registros.asMap().entries.map((e) {
                              return FlSpot(
                                e.key.toDouble(),
                                double.tryParse(
                                      e.value['quantidade'].toString(),
                                    ) ??
                                    0,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Lista de registros
                  Text(
                    'Histórico',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),

                  const SizedBox(height: 10),

                  ...registros.map((registro) {
                    return Card(
                      color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: ListTile(
                        // GOTINHA AZUL ESCURO
                        leading: Icon(Icons.water_drop, color: azulEscuro),

                        title: Text(
                          '${registro['quantidade']} ml',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),

                        subtitle: Text(
                          'Data: ${registro['data']} • '
                          'Peso: ${registro['peso']} kg',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: azulEscuro,
        onPressed: _abrirModal,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
