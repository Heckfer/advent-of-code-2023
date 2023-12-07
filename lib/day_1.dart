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
      print(line);
      print("$firstNumber + $lastNumber = ${(firstNumber * 10) + lastNumber}");
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
    final pattern =
        RegExp(r'(one|two|three|four|five|six|seven|eight|nine|[0-9])');

    final allMatches = pattern.allMatches(line);
    RegExpMatch? firstMatch;
    RegExpMatch? lastMatch;

    print('================');
    print('Line: $line');
    print('All Matches');
    for (RegExpMatch currentMatch in allMatches) {
      print(currentMatch[0]);
    }

    for (RegExpMatch currentMatch in allMatches) {
      print('> Next Iteration');
      int currentMatchStart = currentMatch.start;
      int firstMatchStart = firstMatch?.start ?? 0;
      int lastMatchStart = lastMatch?.start ?? 0;
      print('Current: [${currentMatch[0]}] Index: $currentMatchStart');
      print('First: [${firstMatch?[0]}] Index: $firstMatchStart');
      print('Last: [${lastMatch?[0]}] Index: $lastMatchStart');
      if (firstMatchStart >= currentMatchStart || firstMatch == null) {
        print(
            '$firstMatchStart >= $currentMatchStart: ${firstMatchStart <= currentMatchStart}');
        firstMatch = currentMatch;
      }

      if (lastMatchStart <= currentMatchStart || lastMatch == null) {
        print(
            '$lastMatchStart <= $currentMatchStart: ${lastMatchStart >= currentMatchStart}');
        lastMatch = currentMatch;
      }
    }

    final firstNumber = stringToIntMap[firstMatch![0]]!;
    final lastNumber = stringToIntMap[lastMatch![0]]!;
    return (firstNumber, lastNumber);
  }
}
