import 'package:flutter/material.dart';
import 'package:utilidades/src/controllers/clima_controller.dart';
import 'package:utilidades/src/models/clima_model.dart';
import 'package:utilidades/src/widgets/custom_app_drawer.dart';

class TelaClima extends StatelessWidget {
  const TelaClima({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ClimaController();
    final mediaNotifier = ValueNotifier<double?>(null);
    final historico = <ClimaModel>[];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF8B0000), Color(0xFFFF6347)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: const Text("Previsão do Tempo"),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      drawer: const CustomAppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder<ClimaModel>(
          future: controller.carregarInicial(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Temperatura Inicial: ${snapshot.data!.temperatura.toStringAsFixed(1)}°C",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF8B0000),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  "Atualização em tempo real:",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 8),
                StreamBuilder<ClimaModel>(
                  stream: controller.atualizarClima(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final atual = snapshot.data!;
                      historico.insert(0, atual);
                      if (historico.length > 10) {
                        historico.removeLast();
                      }
                      return Text(
                        "${atual.temperatura.toStringAsFixed(1)}°C",
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF8B0000),
                        ),
                      );
                    }
                    return const Text("Esperando dados...");
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 221, 105, 97),
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 20,
                    ),
                  ),
                  onPressed: () async {
                    if (historico.length < 10) return;
                    final media = await controller.calcularMedia(
                      historico.take(10).toList(),
                    );
                    mediaNotifier.value = media;
                  },
                  child: const Text("Calcular Média (últimos 10)"),
                ),
                const SizedBox(height: 12),
                ValueListenableBuilder<double?>(
                  valueListenable: mediaNotifier,
                  builder: (context, valor, _) {
                    if (valor == null) return const SizedBox();
                    return Text(
                      "Média: ${valor.toStringAsFixed(2)}°C",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
