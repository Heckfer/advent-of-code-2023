import 'dart:convert';
import 'dart:io';
import 'dart:math';

class Day4 {
  static final symbolsExpression = RegExp(r'[^\w^.]');

  static Future<int> solveProblem1(String filePath) async {
    final file = File(filePath);
    final lines = await file
        .openRead()
        .transform(utf8.decoder)
        .transform(LineSplitter())
        .toList();

    num sum = 0;
    for (var line in lines) {
      final numbers = line.trim().split(':').last;
      final numberSplited = numbers.trim().split('|');
      final winningSet = numberSplited.first.trim();
      final actualSet = numberSplited.last.trim();

      final winningNumberList = winningSet
          .split(' ')
          .where((element) => element.isNotEmpty)
          .map((e) => int.parse(e));
      final actualNumbersList = actualSet
          .split(' ')
          .where((element) => element.isNotEmpty)
          .map((e) => int.parse(e));

      var count = 0;
      for (var number in actualNumbersList) {
        if (winningNumberList.contains(number)) {
          count += 1;
        }
      }
      if (count >= 1) {
        sum += pow(2, count - 1);
      }
    }
    return sum.toInt();
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


// Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
// Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
// Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
// Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
// Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
// Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11
