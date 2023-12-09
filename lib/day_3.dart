import 'dart:convert';
import 'dart:io';

class Day3 {
  static Future<int> solveProblem1(String filePath) async {
    final file = File(filePath);
    final lines = await file
        .openRead()
        .transform(utf8.decoder)
        .transform(LineSplitter())
        .toList();

    final matrix = lines.map((e) => e.split('')).toList();
    print(matrix);

    final List<int> numbers = [];

    for (var i = 0; i < matrix.length; i++) {
      final row = matrix[i];

      var numberBuilder = StringBuffer();
      final List<int> possibleNumbers = [];
      for (var j = 0; j < row.length; j++) {
        final possibleNumber = int.tryParse(matrix[i][j]);
        if (possibleNumber == null) {
          if (numberBuilder.isNotEmpty) {
            possibleNumbers.add(int.parse(numberBuilder.toString()));
          }

          numberBuilder = StringBuffer();
          continue;
        }

        numberBuilder.write(possibleNumber);
      }
      print(possibleNumbers);
    }

    return 0;
  }

  static Future<int> solveProblem2(String filePath) async {
    final file = File(filePath);
    final lines = await file
        .openRead()
        .transform(utf8.decoder)
        .transform(LineSplitter())
        .toList();
    return 0;
  }
}
