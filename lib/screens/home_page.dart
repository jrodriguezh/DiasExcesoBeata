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
  late double horassemanales = 0;
  late String textoHorasSemanales = "0";
  late bool paganMinutos = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(child: Text("Días de exceso: Horas Semanales")),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Rellena el siguiente formulario para poder cálcular tus días de exceso:",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const Text(
                "(Por favor, introduce los datos en formato decimal Ej. 2 horas 15 minutos = 2.25 horas.)",
              ),
              TextField(
                controller: lunes,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    icon: Icon(Icons.watch_later_outlined),
                    labelText: "¿Cuántas horas trabajas los Lunes?"),
              ),
              TextField(
                controller: martes,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    icon: Icon(Icons.watch_later_outlined),
                    labelText: "¿Cuántas horas trabajas los Martes?"),
              ),
              TextField(
                controller: miercoles,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    icon: Icon(Icons.watch_later_outlined),
                    labelText: "¿Cuántas horas trabajas los Miércoles?"),
              ),
              TextField(
                controller: jueves,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    icon: Icon(Icons.watch_later_outlined),
                    labelText: "¿Cuántas horas trabajas los Jueves?"),
              ),
              TextField(
                controller: viernes,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    icon: Icon(Icons.watch_later_outlined),
                    labelText: "¿Cuántas horas trabajas los Viernes?"),
              ),
              CheckboxListTile(
                title: const Text("Me Descuentan los 20 Minutos"),
                value: paganMinutos,
                secondary: Icon(Icons.thumb_down),
                onChanged: (newValue) {
                  setState(() {
                    paganMinutos = true;
                  });
                },
                controlAffinity:
                    ListTileControlAffinity.leading, //  <-- leading Checkbox
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text("Total de horas semanales: "),
              ),
              Text(
                textoHorasSemanales,
                style: const TextStyle(fontSize: 25),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      horassemanales = double.parse(lunes.text) +
                          double.parse(martes.text) +
                          double.parse(miercoles.text) +
                          double.parse(jueves.text) +
                          double.parse(viernes.text);
                      textoHorasSemanales = horassemanales.toString();
                    });
                  },
                  child: const Text("CALCULAR"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
