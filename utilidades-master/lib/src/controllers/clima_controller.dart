import '../models/clima_model.dart';
import '../services/clima_service.dart';

class ClimaController {
  final _servico = ClimaService();

  Future<ClimaModel> carregarInicial() async {
    final valor = await _servico.buscarTemperaturaInicial();
    return ClimaModel(valor);
  }

  Stream<ClimaModel> atualizarClima() {
    return _servico.gerarTemperaturas().map((t) => ClimaModel(t));
  }

  Future<double> calcularMedia(List<ClimaModel> dados) async {
    final temp = dados.map((e) => e.temperatura).toList();
    return await ClimaService.calcularMedia(temp);
  }
}
