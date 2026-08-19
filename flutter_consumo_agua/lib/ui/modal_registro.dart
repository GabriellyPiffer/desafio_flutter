import 'package:flutter/material.dart';

class ModalRegistro extends StatelessWidget {
  final TextEditingController dataController;
  final TextEditingController quantidadeController;
  final TextEditingController pesoController;
  final VoidCallback onSalvar;

  const ModalRegistro({
    super.key,
    required this.dataController,
    required this.quantidadeController,
    required this.pesoController,
    required this.onSalvar,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    const azulEscuro = Color(0xFF1565C0);

    return Dialog(
      backgroundColor: isDark ? const Color(0xFF1E1E1E) : Colors.white,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

      child: Padding(
        padding: const EdgeInsets.all(24),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              'Registro de água',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 20),

            _buildCampo('Data', dataController, context),

            const SizedBox(height: 12),

            _buildCampo('Quantidade (ml)', quantidadeController, context),

            const SizedBox(height: 12),

            _buildCampo('Peso (kg)', pesoController, context),

            const SizedBox(height: 24),

            Align(
              alignment: Alignment.centerRight,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: azulEscuro,
                  foregroundColor: Colors.white,
                ),

                onPressed: onSalvar,

                child: const Text('Salvar'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCampo(
    String label,
    TextEditingController controller,
    BuildContext context,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    const azulEscuro = Color(0xFF1565C0);

    return TextField(
      controller: controller,

      style: TextStyle(color: isDark ? Colors.white : Colors.black),

      cursorColor: azulEscuro,

      decoration: InputDecoration(
        labelText: label,

        floatingLabelStyle: const TextStyle(color: azulEscuro),

        filled: true,

        fillColor: isDark ? const Color(0xFF2A2A2A) : Colors.grey[100],

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: isDark ? Colors.white54 : Colors.black26,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: azulEscuro, width: 2),
        ),
      ),
    );
  }
}
