import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/transferencias.dart';
import 'item.dart';
import 'lista.dart';

const _titulo = 'Últimas transferências';
const _conteudoBotao = 'Visualizar todas';

class UltimasTransferencias extends StatelessWidget {
  const UltimasTransferencias({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text(
          _titulo,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Consumer<Transferencias>(
          builder: (context, transferencias, child) {
            final ultimasTransferencias =
                transferencias.transferencias.reversed.toList();
            final quantidade = transferencias.transferencias.length;
            int tamanho;

            if (quantidade < 3) {
              tamanho = quantidade;
            } else {
              tamanho = 2;
            }

            if (quantidade == 0) {
              return const Card(
                margin: EdgeInsets.all(40),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Você ainda não tem nenhuma transferência cadastrada',
                    textAlign: TextAlign.center,
                    style: TextStyle(),
                  ),
                ),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              shrinkWrap: true,
              itemCount: tamanho,
              itemBuilder: (context, indice) {
                final transferencia = ultimasTransferencias[indice];
                final valor = transferencia.toStringValor();
                final conta = transferencia.toStringConta();

                return Item.transferencia(valor, conta);
              },
            );
          },
        ),
        TextButton(
          style: TextButton.styleFrom(backgroundColor: Colors.green),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return const ListaMovimentacoes();
              }),
            );
          },
          child: const Text(
            _conteudoBotao,
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
