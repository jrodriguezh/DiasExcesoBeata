import 'package:diasexceso/screens/percentage_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController lunes = TextEditingController();
  final TextEditingController martes = TextEditingController();
  final TextEditingController miercoles = TextEditingController();
  final TextEditingController jueves = TextEditingController();
  final TextEditingController viernes = TextEditingController();
  late double horasanuales = 0;
  late String textoHorasAnuales = "0";
  late bool paganMinutos = false;
  late bool calculado = false;
  late String textoLadrones = "";
  late double numeroDeLunes = 44;
  late double numeroDeMartes = 45;
  late double numeroDeMiercoles = 46;
  late double numeroDeJueves = 45;
  late double numeroDeViernes = 47;
  //227
  late double numeroDeDiasAno = numeroDeLunes +
      numeroDeMartes +
      numeroDeMiercoles +
      numeroDeJueves +
      numeroDeViernes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(child: Text("Exceso 2022: Horas Trabajadas")),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Por favor, introduce las HORAS en formato DECIMAL Ej. 2 horas y 15 minutos = 2.25 horas. Incluye los 20 minutos de descanso en las horas de trabajo diarias. De otra forma, los calculos no seran correctos. Muchas Gracias.",
                  textAlign: TextAlign.justify,
                ),
              ),
              TextField(
                controller: lunes,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  icon: Icon(Icons.watch_later_outlined),
                  labelText: "¿Cuántas horas trabajas los Lunes?",
                  hintText: "0.0",
                ),
              ),
              TextField(
                controller: martes,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  icon: Icon(Icons.watch_later_outlined),
                  labelText: "¿Cuántas horas trabajas los Martes?",
                  hintText: "0.0",
                ),
              ),
              TextField(
                controller: miercoles,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  icon: Icon(Icons.watch_later_outlined),
                  labelText: "¿Cuántas horas trabajas los Miércoles?",
                  hintText: "0.0",
                ),
              ),
              TextField(
                controller: jueves,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  icon: Icon(Icons.watch_later_outlined),
                  labelText: "¿Cuántas horas trabajas los Jueves?",
                  hintText: "0.0",
                ),
              ),
              TextField(
                controller: viernes,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  icon: Icon(Icons.watch_later_outlined),
                  labelText: "¿Cuántas horas trabajas los Viernes?",
                  hintText: "0.0",
                ),
              ),
              // CheckboxListTile(
              //   title: const Text("Me Descuentan los 20 Minutos del sueldo"),

              //   subtitle: Text(textoLadrones),
              //   value: paganMinutos,
              //   secondary: Icon(Icons.money_off),
              //   onChanged: (newValue) {
              //     setState(() {
              //       paganMinutos = newValue!;
              //       if (paganMinutos == true) {
              //         textoLadrones = "¡Ladrones💰🥷🏽!";
              //       } else {
              //         textoLadrones = "";
              //       }
              //     });
              //   },
              //   controlAffinity:
              //       ListTileControlAffinity.trailing, //  <-- leading Checkbox
              // ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text("Horas que trabajarás este año: "),
              ),
              Text(
                textoHorasAnuales,
                style: const TextStyle(fontSize: 25),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      horasanuales = (double.parse(lunes.text) *
                              numeroDeLunes) +
                          (double.parse(martes.text) * numeroDeMartes) +
                          (double.parse(miercoles.text) * numeroDeMiercoles) +
                          (double.parse(jueves.text) * numeroDeJueves) +
                          (double.parse(viernes.text) * numeroDeViernes);
                      textoHorasAnuales = horasanuales.toStringAsFixed(2);
                      if (horasanuales > 0) {
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
                            builder: (context) => PercentajePage(horasanuales)),
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
