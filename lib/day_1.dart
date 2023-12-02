import 'dart:convert';
import 'dart:io';

class Day1 {
  static Future<int> solveProblem1(String filePath) async {
    final file = File(filePath);
    final result = await file
        .openRead()
        .transform(utf8.decoder)
        .transform(LineSplitter())
        .map((line) {
      int firstNumber = _getFirstNumber(line);
      int lastNumber = _getLastNumber(line);
      return (firstNumber * 10) + lastNumber;
    }).reduce((previous, current) {
      return previous + current;
    });

    return result;
  }

  static int _getFirstNumber(String line) {
    int index = line.indexOf(RegExp(r'[0-9]'));
    return int.parse(line[index]);
  }

  static _getLastNumber(String line) {
    int index = line.lastIndexOf(RegExp(r'[0-9]'));
    return int.parse(line[index]);
  }
}
