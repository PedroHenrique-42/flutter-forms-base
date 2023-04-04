import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/editor.dart';
import '../../models/saldo.dart';

const _tituloAppBar = 'Recebendo depósito';

const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';

const _textoBotaoConfirmar = 'Confirmar';

class FormularioDeposito extends StatelessWidget {
  final TextEditingController _controladorCampoValor = TextEditingController();

  FormularioDeposito({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                dica: _dicaCampoValor,
                controlador: _controladorCampoValor,
                rotulo: _rotuloCampoValor,
                icone: Icons.monetization_on,
              ),
              ElevatedButton(
                child: Text(_textoBotaoConfirmar),
                onPressed: () => _criaDeposito(context),
              ),
            ],
          ),
        ));
  }

  void _criaDeposito(BuildContext context) {
    final double? valor = double.tryParse(_controladorCampoValor.text);
    final depositoValido = _validaTransferencia(context, valor);

    if (depositoValido) {
      _atualizaEstado(context, valor);

      Navigator.pop(context);
    }
  }

  _validaTransferencia(context, valor) {
    final _campoPreenchido = valor != null;

    return _campoPreenchido;
  }

  _atualizaEstado(context, valor) {
    Provider.of<Saldo>(context, listen: false).adiciona(valor);
  }
}
