import 'package:advent_of_code_2023/day_1.dart';
import 'package:advent_of_code_2023/day_2.dart';
import 'package:advent_of_code_2023/day_3.dart';
import 'package:advent_of_code_2023/day_4.dart';
import 'package:test/test.dart';

void main() {
  test('day 1, problem 1', () async {
    int solution =
        await Day1.solveProblem1('test/assets/day1-1_test_input.txt');
    expect(solution, 142);
  });

  test('day 1, problem 2', () async {
    int solution =
        await Day1.solveProblem2('test/assets/day1-2_test_input.txt');
    expect(solution, 292);
  });

  test('day 2, problem 1', () async {
    int solution =
        await Day2.solveProblem1('test/assets/day2-1_test_input.txt');
    expect(solution, 8);
  });

  test('day 2, problem 2', () async {
    int solution =
        await Day2.solveProblem2('test/assets/day2-2_test_input.txt');
    expect(solution, 2286);
  });

  test('day 3, problem 1', () async {
    int solution =
        await Day3.solveProblem1('test/assets/day3-1_test_input.txt');
    expect(solution, 4361);
  });

  test('day 3, problem 2', () async {
    int solution =
        await Day3.solveProblem2('test/assets/day3-2_test_input.txt');
    expect(solution, 467835);
  });

  test('day 4, problem 1', () async {
    int solution =
        await Day4.solveProblem1('test/assets/day4-1_test_input.txt');
    expect(solution, 13);
  });
}
