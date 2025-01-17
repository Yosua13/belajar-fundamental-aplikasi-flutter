import 'package:flutter/material.dart';

class MyContainerWidget extends StatefulWidget {
  const MyContainerWidget({super.key});

  @override
  State<MyContainerWidget> createState() => _MyContainerWidgetState();
}

class _MyContainerWidgetState extends State<MyContainerWidget> {
  double _baseSize = 150;
  final List<double> _fixedSize = [150, 200, 300];

  double _baseScalaFactor = 0.5;
  double _scalaFactor = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      /// Double Tap untuk memperbesar ukuran gambar
      onDoubleTap: () {
        setState(() {
          _baseSize = switch (_baseSize) {
            <= 150 => _fixedSize[1],
            <= 200 => _fixedSize[2],
            <= 300 => _fixedSize[0],
            _ => _fixedSize[1],
          };
          _baseScalaFactor = 1.0;
        });
      },

      /// Tarik gambar menggunakan 2 jari untuk mengubah ukuran gambar
      onScaleStart: (details) {
        _scalaFactor = _baseScalaFactor;
      },
      onScaleUpdate: (details) {
        setState(() {
          _baseScalaFactor = _scalaFactor * details.scale;
        });
      },

      /// Long press untuk memperbesar ukuran
      onLongPressStart: (details) {
        setState(() {
          _baseScalaFactor = 2.0;
        });
      },
      onLongPressEnd: (details) {
        setState(() {
          _baseScalaFactor = 1.0;
        });
      },
      child: AnimatedScale(
        scale: _baseScalaFactor,
        duration: const Duration(milliseconds: 200),
        child: Transform.scale(
          scale: _baseScalaFactor,
          child: Image.asset(
            "assets/cat.jpeg",
            fit: BoxFit.cover,
            height: _baseSize,
            width: _baseSize,
          ),
        ),
      ),
    );
  }
}
