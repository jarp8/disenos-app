import 'package:disenos_app/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class GraficasCircularesPage extends StatefulWidget {
  const GraficasCircularesPage({super.key});

  @override
  State<GraficasCircularesPage> createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {

  double porncentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          porncentaje += 10;

          if(porncentaje > 100) {
            porncentaje = 0;
          }

          setState(() {});
        },
        child: const Icon(Icons.refresh),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          child: RadialProgress(porcentaje: porncentaje),
        )
      ),
    );
  }
}