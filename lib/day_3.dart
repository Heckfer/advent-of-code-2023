import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

class Day3 {
  static final symbolsExpression = RegExp(r'[^\w^.]');

  static Future<int> solveProblem1(String filePath) async {
    final file = File(filePath);
    final lines = await file
        .openRead()
        .transform(utf8.decoder)
        .transform(LineSplitter())
        .toList();

    final matrix = lines.map((e) => e.split('')).toList();

    var sum = 0;
    for (var i = 0; i < matrix.length; i++) {
      final currentRow = matrix[i];

      var numberBuilder = StringBuffer();
      var isAdjacentToSymbol = false;
      for (var j = 0; j < currentRow.length; j++) {
        final numberAtPosition = int.tryParse(matrix[i][j]);
        if (numberAtPosition == null) {
          continue;
        }

        numberBuilder.write(numberAtPosition);

        final neighbours = [
          matrix[max(i - 1, 0)][max(j - 1, 0)],
          matrix[max(i - 1, 0)][j],
          matrix[max(i - 1, 0)][min(j + 1, currentRow.length - 1)],
          matrix[i][max(j - 1, 0)],
          matrix[i][min(j + 1, currentRow.length - 1)],
          matrix[min(i + 1, matrix.length - 1)][max(j - 1, 0)],
          matrix[min(i + 1, matrix.length - 1)][j],
          matrix[min(i + 1, matrix.length - 1)]
              [min(j + 1, currentRow.length - 1)]
        ];

        for (var neighbour in neighbours) {
          if (symbolsExpression.hasMatch(neighbour)) {
            isAdjacentToSymbol = true;
          }
        }

        final shouldFinish = (j == currentRow.length - 1) ||
            int.tryParse(matrix[i][j + 1]) == null;

        if (shouldFinish) {
          if (numberBuilder.isNotEmpty) {
            final newNumber = int.parse(numberBuilder.toString());

            if (isAdjacentToSymbol) {
              sum += newNumber;
            }
          }

          isAdjacentToSymbol = false;
          numberBuilder = StringBuffer();
        }
      }
    }

    return sum;
  }

  static Future<int> solveProblem2(String filePath) async {
    final file = File(filePath);
    final lines = await file
        .openRead()
        .transform(utf8.decoder)
        .transform(LineSplitter())
        .toList();

    final matrix = lines.map((e) => e.split('')).toList();

    HashMap<(int, int), List<int>> possibleNumbers = HashMap();

    for (var i = 0; i < matrix.length; i++) {
      final currentRow = matrix[i];

      var numberBuilder = StringBuffer();

      (int, int)? adjacentStarPosition;

      for (var j = 0; j < currentRow.length; j++) {
        final numberAtPosition = int.tryParse(matrix[i][j]);
        if (numberAtPosition == null) {
          continue;
        }

        numberBuilder.write(numberAtPosition);

        final neighbours = [
          (max(i - 1, 0), max(j - 1, 0)),
          (max(i - 1, 0), j),
          (max(i - 1, 0), min(j + 1, currentRow.length - 1)),
          (i, max(j - 1, 0)),
          (i, min(j + 1, currentRow.length - 1)),
          (min(i + 1, matrix.length - 1), max(j - 1, 0)),
          (min(i + 1, matrix.length - 1), j),
          (min(i + 1, matrix.length - 1), min(j + 1, currentRow.length - 1))
        ];

        for (var neighbour in neighbours) {
          if (matrix[neighbour.$1][neighbour.$2] == "*") {
            adjacentStarPosition = neighbour;
          }
        }

        final shouldFinish = (j == currentRow.length - 1) ||
            int.tryParse(matrix[i][j + 1]) == null;

        if (shouldFinish) {
          if (numberBuilder.isNotEmpty) {
            final newNumber = int.parse(numberBuilder.toString());

            if (adjacentStarPosition != null) {
              if (possibleNumbers[adjacentStarPosition] == null) {
                possibleNumbers[adjacentStarPosition] = [];
              }

              possibleNumbers[adjacentStarPosition]!.add(newNumber);
            }
          }

          adjacentStarPosition = null;
          numberBuilder = StringBuffer();
        }
      }
    }

    return possibleNumbers.values.map((numbersList) {
      if (numbersList.length <= 1) {
        return 0;
      }
      return numbersList.reduce((value, element) => value * element);
    }).reduce((value, element) => value + element);
  }
}
