import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class GraficoAbastecimentos extends StatelessWidget {
  final List<double> valores;

  const GraficoAbastecimentos({super.key, required this.valores});

  static const Color rosa = Color(0xFFE91E63);

  @override
  Widget build(BuildContext context) {
    if (valores.isEmpty) {
      return const Center(
        child: Text(
          'Nenhum dado disponível',
          style: TextStyle(color: Colors.white70),
        ),
      );
    }

    return LineChart(
      LineChartData(
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                return Text(
                  value.toStringAsFixed(1),
                  style: const TextStyle(color: Colors.white70, fontSize: 10),
                );
              },
            ),
          ),

          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                return Text(
                  'Ab${value.toInt() + 1}',
                  style: const TextStyle(color: Colors.white70, fontSize: 10),
                );
              },
            ),
          ),
        ),

        gridData: FlGridData(show: true),

        borderData: FlBorderData(show: true, border: Border.all(color: rosa)),

        lineBarsData: [
          LineChartBarData(
            spots: valores
                .asMap()
                .entries
                .map((e) => FlSpot(e.key.toDouble(), e.value))
                .toList(),

            isCurved: true,

            color: rosa,

            barWidth: 3,

            dotData: FlDotData(show: true),
          ),
        ],
      ),
    );
  }
}
