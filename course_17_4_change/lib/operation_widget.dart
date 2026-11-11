import 'package:flutter/material.dart';
import 'package:course_17_4/calculator.dart';
import 'package:course_17_4/operation.dart';
import 'package:course_17_4/service/number_api_service.dart';
import 'package:http/http.dart' as http;

class OperationWidget extends StatefulWidget {
  final Operation operation;
  final Calculator calculator;

  const OperationWidget({super.key, required this.operation, required this.calculator});

  @override
  State<OperationWidget> createState() => _OperationWidgetState();
}

class _OperationWidgetState extends State<OperationWidget> {
  late NumberApiService _numberApiService;
  final _topTextController = TextEditingController();
  final _bottomTextController = TextEditingController();

  String _operationResult = '';
  String numberInfo = '';

  @override
  void initState() {
    _numberApiService = NumberApiService(client: http.Client());
    _topTextController.addListener(_getResult);
    _bottomTextController.addListener(_getResult);
    super.initState();
  }

  @override
  void dispose() {
    _topTextController.dispose();
    _bottomTextController.dispose();
    _numberApiService.client.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title:  Text(
        widget.operation.descriptionOperation,
        style: const TextStyle(fontSize: 20),
      ),
      leading:  widget.operation.iconOperation,
      subtitle: Column(
        children: [
          TextField(
            key: Key('textField_top_${widget.operation.descriptionOperation}'),
            controller: _topTextController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: 'Введите первое число'),
          ),
          TextField(
            key: Key('textField_bottom_${widget.operation.descriptionOperation}'),
            controller: _bottomTextController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: 'Введите второе число'),
          ),
          const SizedBox(height: 20),
          Text(
            'Результат: $_operationResult',
            style: Theme.of(context).textTheme.titleLarge,
           ),
           const Divider(),
           Text(
            numberInfo,
            style: const TextStyle(
              fontSize: 20,
             ),
           ),
           ElevatedButton(
            key:
               Key('elevated_button_${widget.operation.descriptionOperation}'),
            child: const Text ('Факт о числе'),
            onPressed: () async {
              if (_operationResult.isNotEmpty) {
                try {
                  final value = await _numberApiService.getNumberFact(
                    double.parse(_operationResult).round(),
                  );
                  if (!mounted) return;
                  setState(() {
                    numberInfo = value.text;
                  });
                } catch (_) {
                  if (!mounted) return;
                  setState(() {
                    numberInfo = 'Не удалось загрузить сведения о числе';
                  });
                }
              }
            },
           ),
          //AnimatedContainer(
          //  padding: const EdgeInsets.all(8),
          //  duration: const Duration(milliseconds: 1000),
          //  onEnd: () {
          //    setState(() {
          //      _resultAfterAnimation = _operationResult.toString();
          //    });
          // },
          //  color: _operationResult.isEmpty ? Colors.transparent : Colors.green,
          //  curve: Curves.easeInOut,
          //  child: Text(
          //    _resultAfterAnimation.isNotEmpty
          //        ? 'Результат: $_resultAfterAnimation'
          //        : 'Результат: ',
          //    style: Theme.of(context).textTheme.bodyMedium,
          //    textAlign: TextAlign.end,
          // ),
          //),
        ],
      ),
    );
  }

  void _getResult() {
    try {
      final result = _calculate(
        double.tryParse(_topTextController.text)!,
        double.tryParse(_bottomTextController.text)!,
      );
      setState(() {
        _operationResult = result.toString();
      });
    } catch (_) {
      setState(() {
        _operationResult = '';
      });
    }
  }

  double _calculate(double top, double bottom) {
    double result;
    switch (widget.operation) {
      case Operation.add:
        result = widget.calculator.add(top, bottom);
        break;
      case Operation.substract:
        result = widget.calculator.substract(top, bottom);
        break;
      case Operation.multiply:
        result = widget.calculator.multiply(top, bottom);
        break;
      case Operation.divide:
        result = widget.calculator.divide(top, bottom);
        break;
    }
    return result;
  }
}
