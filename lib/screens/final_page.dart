import 'package:flutter/material.dart';

class FinalPage extends StatefulWidget {
  final double horasAnualesMenosVeinteMinutos;
  final double horasAnualesPagadas;
  final bool agostoSummer;
  final bool julioSummer;
  final bool cursoFormacion;
  const FinalPage(this.horasAnualesMenosVeinteMinutos, this.horasAnualesPagadas,
      this.agostoSummer, this.julioSummer, this.cursoFormacion,
      {super.key});

  @override
  State<FinalPage> createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {
  late double horasFinales =
      widget.horasAnualesMenosVeinteMinutos - widget.horasAnualesPagadas;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Exceso 2022: Calculo Final")),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Este año te han computado:",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${widget.horasAnualesMenosVeinteMinutos.toStringAsFixed(2)} Horas",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Este año te van a pagar por trabajar:",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${widget.horasAnualesPagadas.toStringAsFixed(2)} Horas",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  if (horasFinales > 0)
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Por lo que la empresa te debe:",
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ),
                  if (horasFinales > 0)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${horasFinales.toStringAsFixed(2)} Horas",
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.green,
                              fontWeight: FontWeight.bold)),
                    ),
                  if (horasFinales < 0)
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Por lo que debes a la empresa:",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  if (horasFinales < 0)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${horasFinales.toStringAsFixed(2)} Horas",
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Extra: ",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  if (widget.agostoSummer == true)
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                          "Te deben un día extra por haber disfrutado tus vacaciones durante el festivo de agosto",
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ),
                  if (widget.julioSummer == true)
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                          "Te deben un día extra por haber disfrutado tus vacaciones durante el festivo de julio",
                          style: TextStyle(fontSize: 20)),
                    ),
                  if (widget.cursoFormacion == true)
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                          "Te deben las horas del tiempo dedicado al curso de formación fuera de tu horario laboral",
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                        "Por último, además de esto, debido al Acuerdo Puente del convenio firmado por CCOO en noviembre de 2021, tienes derecho a un día más de exceso.",
                        style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
