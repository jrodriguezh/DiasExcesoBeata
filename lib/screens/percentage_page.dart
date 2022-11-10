import 'package:diasexceso/screens/final_page.dart';
import 'package:flutter/material.dart';

class PercentajePage extends StatefulWidget {
  final double horasanuales;
  const PercentajePage(this.horasanuales, {super.key});

  @override
  State<PercentajePage> createState() => _PercentajePageState();
}

class _PercentajePageState extends State<PercentajePage> {
  final TextEditingController porcentajeTextController =
      TextEditingController();
  late bool paganMinutos = false;
  late String textoLadrones = "";
  late bool unicoPorcentaje = false;
  late bool agostoSummer = false;
  late bool julioSummer = false;
  late bool cursoFormacion = false;
  late bool calculado = false;
  late String textoHorasAnualesPagadas = "0.0";
  late double horasAnualesMenosVeinteMinutos = 0;
  late double horas = 0;
  late double horasAnualesPagadas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Exceso 2022: Horas Pagadas")),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: CheckboxListTile(
                  title: const Text("Me Descuentan los 20 Minutos del sueldo"),
                  subtitle: Text(textoLadrones),
                  value: paganMinutos,
                  secondary: const Icon(Icons.money_off),
                  onChanged: (newValue) {
                    setState(() {
                      paganMinutos = newValue!;
                      if (paganMinutos == true) {
                        textoLadrones = "¡Malditos Ladrones💰🥷🏽!";
                        horasAnualesMenosVeinteMinutos =
                            widget.horasanuales - (227 * 0.33);
                      } else {
                        textoLadrones = "";
                        horasAnualesMenosVeinteMinutos = widget.horasanuales;
                      }
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.trailing, //  <-- leading Checkbox
                ),
              ),
              // CheckboxListTile(
              //   title: const Text(
              //       "He tenido varios porcentajes diferentes de jornada este año"),
              //   value: unicoPorcentaje,
              //   secondary: const Icon(Icons.account_balance),
              //   onChanged: (newValue) {
              //     setState(() {
              //       unicoPorcentaje = newValue!;
              //     });
              //   },
              //   controlAffinity:
              //       ListTileControlAffinity.trailing, //  <-- leading Checkbox
              // ),
              CheckboxListTile(
                title: const Text(
                    "Durante mis vacaciones de verano ha caido el 15 de Agosto."),
                value: agostoSummer,
                secondary: const Icon(Icons.beach_access),
                onChanged: (newValue) {
                  setState(() {
                    agostoSummer = newValue!;
                  });
                },
                controlAffinity:
                    ListTileControlAffinity.trailing, //  <-- leading Checkbox
              ),
              CheckboxListTile(
                title: const Text(
                    "Durante mis vacaciones de verano ha caido el 25 de Julio"),
                value: julioSummer,
                secondary: const Icon(Icons.beach_access),
                onChanged: (newValue) {
                  setState(() {
                    julioSummer = newValue!;
                  });
                },
                controlAffinity:
                    ListTileControlAffinity.trailing, //  <-- leading Checkbox
              ),
              CheckboxListTile(
                title: const Text(
                    "He hecho un curso de formación fuera de mi tiempo de jornada"),
                value: cursoFormacion,
                secondary: const Icon(Icons.book),
                onChanged: (newValue) {
                  setState(() {
                    cursoFormacion = newValue!;
                  });
                },
                controlAffinity:
                    ListTileControlAffinity.trailing, //  <-- leading Checkbox
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: porcentajeTextController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.monetization_on),
                      labelText: "Introduce tu Porcentaje de Jornada",
                      hintText: "No pongas el simbolo % al final"),
                ),
              ),

              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Horas que la empresa te pagará por trabajar este año: ",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                textoHorasAnualesPagadas,
                style: const TextStyle(fontSize: 25),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      horasAnualesPagadas =
                          double.parse(porcentajeTextController.text) * 16.80;
                      textoHorasAnualesPagadas =
                          horasAnualesPagadas.toStringAsFixed(2);
                      if (horasAnualesPagadas > 0) {
                        calculado = true;
                      }
                    });
                  },
                  child: const Text("CALCULAR"),
                ),
              ),
              if (calculado)
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FinalPage(
                                horasAnualesMenosVeinteMinutos,
                                horasAnualesPagadas,
                                agostoSummer,
                                julioSummer,
                                cursoFormacion)),
                      );
                    },
                    child: const Text(
                      "SIGUIENTE",
                      style: TextStyle(fontSize: 20),
                    ))
            ],
          ),
        ),
      ),
    );
  }
}
