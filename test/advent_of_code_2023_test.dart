import 'package:advent_of_code_2023/day_1.dart';
import 'package:test/test.dart';

void main() {
  test('day 1, problem 1', () async {
    int solution = await Day1.solveProblem1('test/assets/day1_test_input.txt');
    expect(solution, 142);
  });
}
