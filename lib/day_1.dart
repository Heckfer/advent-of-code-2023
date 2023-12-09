import 'dart:convert';
import 'dart:io';

class Day1 {
  static var stringToIntMap = {
    "one": 1,
    "two": 2,
    "three": 3,
    "four": 4,
    "five": 5,
    "six": 6,
    "seven": 7,
    "eight": 8,
    "nine": 9,
    "1": 1,
    "2": 2,
    "3": 3,
    "4": 4,
    "5": 5,
    "6": 6,
    "7": 7,
    "8": 8,
    "9": 9,
  };

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

  static Future<int> solveProblem2(String filePath) async {
    final file = File(filePath);
    final result = await file
        .openRead()
        .transform(utf8.decoder)
        .transform(LineSplitter())
        .map((line) {
      final (firstNumber, lastNumber) = _getNumbers(line);
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
    RegExp("");
    int index = line.lastIndexOf(RegExp(r'[0-9]'));
    return int.parse(line[index]);
  }

  static (int, int) _getNumbers(String line) {
    final patterns = [
      RegExp(r'one'),
      RegExp(r'two'),
      RegExp(r'three'),
      RegExp(r'four'),
      RegExp(r'five'),
      RegExp(r'six'),
      RegExp(r'seven'),
      RegExp(r'eight'),
      RegExp(r'nine'),
      RegExp('[0-9]')
    ];

    Match? firstMatch;
    Match? lastMatch;

    for (RegExp pattern in patterns) {
      final allMatches = pattern.allMatches(line);
      if (allMatches.isEmpty) {
        continue;
      }

      allMatches.toList().sort((a, b) => (a.start.compareTo(b.start)));

      int firstMatchStart = firstMatch?.start ?? 0;
      int lastMatchStart = lastMatch?.start ?? 0;

      if (firstMatchStart >= allMatches.first.start || firstMatch == null) {
        firstMatch = allMatches.first;
      }

      if (lastMatchStart <= allMatches.last.start || lastMatch == null) {
        lastMatch = allMatches.last;
      }
    }

    final firstNumber = stringToIntMap[firstMatch![0]]!;
    final lastNumber = stringToIntMap[lastMatch![0]]!;
    return (firstNumber, lastNumber);
  }
}
