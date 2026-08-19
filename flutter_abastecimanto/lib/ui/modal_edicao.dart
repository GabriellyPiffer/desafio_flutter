import 'package:flutter/material.dart';
import '../models/abastecimento.dart';

class ModalEdicao extends StatefulWidget {
  final Abastecimento? abastecimento;
  final Function(Abastecimento) onSave;

  const ModalEdicao({super.key, this.abastecimento, required this.onSave});

  @override
  State<ModalEdicao> createState() => _ModalEdicaoState();
}

class _ModalEdicaoState extends State<ModalEdicao> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController dataCtrl;
  late TextEditingController combustivelCtrl;
  late TextEditingController litrosCtrl;
  late TextEditingController valorCtrl;
  late TextEditingController kmCtrl;

  @override
  void initState() {
    super.initState();
    dataCtrl = TextEditingController(text: widget.abastecimento?.data ?? '');
    combustivelCtrl = TextEditingController(
      text: widget.abastecimento?.combustivel ?? '',
    );
    litrosCtrl = TextEditingController(
      text: widget.abastecimento?.litros.toString() ?? '',
    );
    valorCtrl = TextEditingController(
      text: widget.abastecimento?.valorPago.toString() ?? '',
    );
    kmCtrl = TextEditingController(
      text: widget.abastecimento?.quilometragem.toString() ?? '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        widget.abastecimento == null
            ? 'Novo Abastecimento'
            : 'Editar Abastecimento',
      ),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: dataCtrl,
                decoration: const InputDecoration(labelText: 'Data'),
                validator: (v) => v!.isEmpty ? 'Informe a data' : null,
              ),
              TextFormField(
                controller: combustivelCtrl,
                decoration: const InputDecoration(labelText: 'Combustível'),
                validator: (v) => v!.isEmpty ? 'Informe o combustível' : null,
              ),
              TextFormField(
                controller: litrosCtrl,
                decoration: const InputDecoration(labelText: 'Litros'),
                keyboardType: TextInputType.number,
                validator: (v) => v!.isEmpty ? 'Informe os litros' : null,
              ),
              TextFormField(
                controller: valorCtrl,
                decoration: const InputDecoration(labelText: 'Valor Pago'),
                keyboardType: TextInputType.number,
                validator: (v) => v!.isEmpty ? 'Informe o valor' : null,
              ),
              TextFormField(
                controller: kmCtrl,
                decoration: const InputDecoration(labelText: 'Quilometragem'),
                keyboardType: TextInputType.number,
                validator: (v) => v!.isEmpty ? 'Informe a quilometragem' : null,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final novo = Abastecimento(
                data: dataCtrl.text,
                combustivel: combustivelCtrl.text,
                litros:
                    double.tryParse(litrosCtrl.text.replaceAll(',', '.')) ?? 0,
                valorPago:
                    double.tryParse(valorCtrl.text.replaceAll(',', '.')) ?? 0,
                quilometragem:
                    double.tryParse(kmCtrl.text.replaceAll(',', '.')) ?? 0,
              );
              widget.onSave(novo);
              Navigator.pop(context);
            }
          },
          child: const Text('Salvar'),
        ),
      ],
    );
  }
}
