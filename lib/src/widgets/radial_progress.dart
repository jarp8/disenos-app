import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {

  final double porcentaje;

  const RadialProgress({super.key, required this.porcentaje});

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late double porcentajeAnterior;

  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;

    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MyRadialProgress(
              porcentaje: (widget.porcentaje - diferenciaAnimar) + (diferenciaAnimar * controller.value)
            ),
          ),
        );
      },
    );
  }
}


class _MyRadialProgress extends CustomPainter {
  final double porcentaje;

  _MyRadialProgress({required this.porcentaje});

  @override
  void paint(Canvas canvas, Size size) {

    // Circulo completado
    final paint = Paint()
      ..strokeWidth = 4
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

      final center = Offset(size.width * 0.5, size.height * 0.5);
      final double radio = min(size.width * 0.5, size.height * 0.5);

      canvas.drawCircle(center, radio, paint);

      // Arco
      final paintArco = Paint()
        ..strokeWidth = 10
        ..color = Colors.pink
        ..style = PaintingStyle.stroke;

      // Parte que se deberà ir llenando
      double arcAngle = 2 * pi * (porcentaje / 100);
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radio),
        -pi / 2,
        arcAngle,
        false,
        paintArco
      );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}