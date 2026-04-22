import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../root/pallet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List funcionarios = [];
  int indexAtual = 0;
  String? selecionado;

  @override
  void initState() {
    super.initState();
    carregarJson();
  }

  Future<void> carregarJson() async {
    final String response =
        await rootBundle.loadString('assets/mockup/funcionarios.json');

    final data = json.decode(response);

    setState(() {
      funcionarios = data;
      selecionado = funcionarios.isNotEmpty ? funcionarios[0]["nome"] : null;
    });
  }

  void proximo() {
    if (indexAtual < funcionarios.length - 1) {
      setState(() {
        indexAtual++;
        selecionado = funcionarios[indexAtual]["nome"];
      });
    }
  }

  void anterior() {
    if (indexAtual > 0) {
      setState(() {
        indexAtual--;
        selecionado = funcionarios[indexAtual]["nome"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    if (funcionarios.isEmpty) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final funcionario = funcionarios[indexAtual];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Funcionários"),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.t1,
                borderRadius: BorderRadius.circular(30),
              ),
              child: DropdownButton<String>(
                value: selecionado,
                isExpanded: true,
                underline: const SizedBox(),
                items: funcionarios.map<DropdownMenuItem<String>>((item) {
                  return DropdownMenuItem<String>(
                    value: item["nome"],
                    child: Text(item["nome"] ?? "Sem nome"),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selecionado = value;
                    indexAtual = funcionarios.indexWhere(
                      (e) => e["nome"] == value,
                    );
                  });
                },
              ),
            ),
          ),

          const SizedBox(height: 20),

          Container(
            width: 260,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(color: Colors.black26, blurRadius: 8)
              ],
            ),
            child: Column(
              children: [

                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    funcionario["avatar"] ?? "",
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.person, size: 80);
                    },
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  funcionario["nome"] ?? "Sem nome",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.p4,
                  ),
                ),

                const SizedBox(height: 8),

                Text("Cargo: ${funcionario["cargo"] ?? "-"}"),
                Text("Salário: R\$ ${funcionario["salario"] ?? "-"}"),
              ],
            ),
          ),

          const SizedBox(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: anterior,
                child: const Text("Anterior"),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: proximo,
                child: const Text("Próximo"),
              ),
            ],
          )
        ],
      ),
    );
  }
}