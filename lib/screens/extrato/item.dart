import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final String _valor;
  String _conta;
  String _tipo;

  final Map<String, Color> _cores = {
    'debito': Colors.red,
    'credito': Colors.green,
  };

  Item(this._valor, this._conta, this._tipo, {super.key});

  Item.transferencia(this._valor, this._conta, {super.key}) : _tipo = 'debito';

  Item.deposito(this._valor, {super.key})
      : _conta = '',
        _tipo = 'credito';

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.monetization_on,
          color: _cores[_tipo],
        ),
        title: Text(_valor),
        subtitle: Text(_conta),
      ),
    );
  }
}
