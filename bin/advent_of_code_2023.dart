import 'package:advent_of_code_2023/day_1.dart';
import 'package:advent_of_code_2023/day_2.dart';
import 'package:advent_of_code_2023/day_3.dart';

void main(List<String> arguments) async {
  final day1Problem1Result =
      await Day1.solveProblem1('assets/day1-1_input.txt');
  print('Day 1 Problem 1: $day1Problem1Result');

  final day1Problem2Result =
      await Day1.solveProblem2('assets/day1-2_input.txt');
  print('Day 1 Problem 2: $day1Problem2Result');

  final day2Problem1Result =
      await Day2.solveProblem1('assets/day2-1_input.txt');
  print('Day 2 Problem 1: $day2Problem1Result');

  final day2Problem2Result =
      await Day2.solveProblem2('assets/day2-2_input.txt');
  print('Day 2 Problem 2: $day2Problem2Result');

  final day3Problem1Result =
      await Day3.solveProblem1('assets/day3-1_input.txt');
  print('Day 3 Problem 1: $day3Problem1Result');
}
