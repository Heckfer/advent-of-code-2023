import 'dart:convert';
import 'dart:io';
import 'dart:math';

class Day2 {
  static Future<int> solveProblem1(String filePath) async {
    final file = File(filePath);
    final lines = await file
        .openRead()
        .transform(utf8.decoder)
        .transform(LineSplitter())
        .toList();

    List<(int, Iterable<Hand>)> games = [];

    for (var line in lines) {
      final gameIdAndValues = line.split(':');
      final gameId = int.parse(gameIdAndValues.first.split(' ').last);

      var hands = gameIdAndValues.last.split(';');

      final gameHands = hands.map((hand) {
        final cubesData = hand.split(',');
        var red = 0;
        var green = 0;
        var blue = 0;

        for (String cube in cubesData) {
          if (cube.contains('red')) {
            red = int.parse(cube.trim().split(' ').first);
          }

          if (cube.contains('green')) {
            green = int.parse(cube.trim().split(' ').first);
          }

          if (cube.contains('blue')) {
            blue = int.parse(cube.trim().split(' ').first);
          }
        }
        return Hand(red, green, blue);
      });

      games.add((gameId, gameHands));
    }

    final referenceHand = Hand(12, 13, 14);

    return games.map((game) {
      final areAllHandsPossible = game.$2
          .map((hand) => hand.isContainedBy(referenceHand))
          .reduce((value, element) => value && element);

      return areAllHandsPossible ? game.$1 : 0;
    }).reduce((value, element) => value + element);
  }

  static Future<int> solveProblem2(String filePath) async {
    final file = File(filePath);
    final lines = await file
        .openRead()
        .transform(utf8.decoder)
        .transform(LineSplitter())
        .toList();

    List<(int, Iterable<Hand>)> games = [];

    for (var line in lines) {
      final gameIdAndValues = line.split(':');
      final gameId = int.parse(gameIdAndValues.first.split(' ').last);

      var hands = gameIdAndValues.last.split(';');

      final gameHands = hands.map((hand) {
        final cubesData = hand.split(',');
        var red = 0;
        var green = 0;
        var blue = 0;

        for (String cube in cubesData) {
          if (cube.contains('red')) {
            red = int.parse(cube.trim().split(' ').first);
          }

          if (cube.contains('green')) {
            green = int.parse(cube.trim().split(' ').first);
          }

          if (cube.contains('blue')) {
            blue = int.parse(cube.trim().split(' ').first);
          }
        }
        return Hand(red, green, blue);
      });

      games.add((gameId, gameHands));
    }

    return games.map((game) {
      var maxRed = 0;
      var maxGreen = 0;
      var maxBlue = 0;

      for (final hand in game.$2) {
        maxRed = max(hand.redCount, maxRed);
        maxGreen = max(hand.greenCount, maxGreen);
        maxBlue = max(hand.blueCount, maxBlue);
      }
      return maxRed * maxGreen * maxBlue;
    }).reduce((value, element) => value + element);
  }
}

class Hand {
  final int redCount;
  final int greenCount;
  final int blueCount;

  Hand(this.redCount, this.greenCount, this.blueCount);

  @override
  String toString() {
    return "($redCount red, $greenCount green, $blueCount blue)";
  }

  bool isContainedBy(Hand referenceHand) {
    return referenceHand.redCount >= redCount &&
        referenceHand.greenCount >= greenCount &&
        referenceHand.blueCount >= blueCount;
  }
}
