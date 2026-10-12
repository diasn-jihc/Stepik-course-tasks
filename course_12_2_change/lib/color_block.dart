import 'dart:async';
import 'package:flutter/material.dart';

enum ColorEvent { blue, orange }

class ColorBloc {
  Color _color = Colors.blue;

  final _inputEventController = StreamController<ColorEvent>();
  StreamSink<ColorEvent> get inputEventSink => _inputEventController.sink;

  final _outputStateController = StreamController<Color>();
  Stream<Color> get outputStateStream => _outputStateController.stream;

  void _mapEventToState(ColorEvent event) {
    if (event == ColorEvent.blue) {
      _color = Colors.blue;
    } else if (event == ColorEvent.orange) {
      _color = Colors.orange;
    } else {
      throw Exception('Неверный тип события');
    }

    _outputStateController.sink.add(_color);
  }

  ColorBloc() {
    _inputEventController.stream.listen(_mapEventToState);
  }

  void dispose() {
    _inputEventController.close();
    _outputStateController.close();
  }
}
