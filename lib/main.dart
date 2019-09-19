import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
      debugShowCheckedModeBanner: true,
    );
  }
}

// Criando o Formulário de Transferencia
class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferência'),
      ),
      body: Column(
        children: <Widget>[
          Editor(
            controlador: _controladorCampoNumeroConta,
            dica: '0000',
            rotulo: 'Número da conta',
            icone: Icons.lock_outline,
          ),
          Editor(
            controlador: _controladorCampoValor,
            dica: '000.0',
            icone: Icons.monetization_on,
            rotulo: 'Valor',
          ),
          SalvarTransferencia(
              _controladorCampoNumeroConta, _controladorCampoValor)
        ],
      ),
    );
  }
}

class SalvarTransferencia extends StatelessWidget {
  final TextEditingController _numeroConta;
  final TextEditingController _valor;

  SalvarTransferencia(this._numeroConta, this._valor);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          final int numeroConta = int.tryParse(_numeroConta.text);
          final double valor = double.tryParse(_valor.text);

          if (numeroConta != null && valor != null) {
            final transferenciaCriada = Transferencia(valor, numeroConta);
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('$transferenciaCriada'),
              ),
            );
          }
        },
        child: Text('Confirmar'),
      ),
    );
  }
}

// Editor
class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;

  Editor({this.controlador, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: controlador,
          style: TextStyle(
            fontSize: 24.0,
          ),
          decoration: InputDecoration(
            icon: Icon(icone),
            labelText: rotulo,
            hintText: dica,
          ),
          keyboardType: TextInputType.number,
        ),
      ),
    );
  }
}

// Criando a Lista de Transferencias
class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferencia(300.5, 3323)),
          ItemTransferencia(Transferencia(2000.5, 4343)),
          ItemTransferencia(Transferencia(1000, 1234))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

// Criando um Item transferencia
class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(this._transferencia.valor.toString()),
        subtitle: Text(this._transferencia.numeroConta.toString()),
      ),
    );
  }
}

// Model de Transferencia
class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferência -- Valor: $valor, Número Conta: $numeroConta';
  }
}
