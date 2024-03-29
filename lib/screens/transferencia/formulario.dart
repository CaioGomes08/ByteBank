// Criando o Formulário de Transferencia
import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar =  'Criando Transferência';

const _dicaCampoConta = '0000';
const _dicaCampoValor = '000.0';

const _rotuloCampoConta = 'Número da conta';
const _rotuloCampoValor = 'Valor';

const _buttonConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {    
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {

  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

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
              controlador: _controladorCampoNumeroConta,
              dica: _dicaCampoConta,
              rotulo: _rotuloCampoConta,
              icone: Icons.lock_outline,
            ),
            Editor(
              controlador: _controladorCampoValor,
              dica: _dicaCampoValor,
              icone: Icons.monetization_on,
              rotulo: _rotuloCampoValor,
            ),
            RaisedButton(
              onPressed: () => _criaTransferencia(context),
              child: Text(_buttonConfirmar),
            ),
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);

    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
