import 'package:flutter/material.dart';

import 'package:disenos_app/src/widgets/radial_progress.dart';

class GraficasCircularesPage extends StatefulWidget {
  const GraficasCircularesPage({super.key});

  @override
  State<GraficasCircularesPage> createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {

  double porncentaje = 0.0;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

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
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _RadialWidget(porncentaje: porncentaje, colorPrimario: Colors.red,),
              _RadialWidget(porncentaje: porncentaje, colorPrimario: Colors.blue,),
              _RadialWidget(porncentaje: porncentaje, colorPrimario: Colors.black,),
            ],
          ),
        ),
      ),
    );
  }
}

class _RadialWidget extends StatelessWidget {
  const _RadialWidget({
    required this.porncentaje, required this.colorPrimario,
  });

  final double porncentaje;
  final Color colorPrimario;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: RadialProgress(
        porcentaje: porncentaje,
        colorPrimario: colorPrimario,
      )
    );
  }
}