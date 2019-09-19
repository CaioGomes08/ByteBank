// Model de Transferencia
class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(
    this.valor,
    this.numeroConta,
  );

  @override
  String toString() {
    return 'Transferência -- Valor: $valor, Número Conta: $numeroConta';
  }
}
