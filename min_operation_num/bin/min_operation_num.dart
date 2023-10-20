import 'package:min_operation_num/min_operation_num.dart' as min_operation_num;
import 'dart:math';

void main(List<String> arguments) {
  Solution solution = Solution();
  int test = solution.convertTime("00:00", "23:59");
  print(test);
}

class Solution {
  int convertTime(String current, String correct) {
    final partsCurrent = current.split(":");
    final partsCorrect = correct.split(":");
    int operationOnMinutes = 0;
    int operations = 0;

    operations = int.parse(partsCorrect[0]) - int.parse(partsCurrent[0]);
    int minutes = (int.parse(partsCorrect[1]) - int.parse(partsCurrent[1])) >= 0
        ? int.parse(partsCorrect[1]) - int.parse(partsCurrent[1])
        : int.parse(partsCorrect[1]) - int.parse(partsCurrent[1]) + 60;

    if ((int.parse(partsCorrect[1]) - int.parse(partsCurrent[1])) < 0) {
      operations = int.parse(partsCorrect[0]) - int.parse(partsCurrent[0]) - 1;
    }

    if (minutes >= 15) {
      operationOnMinutes = minutes ~/ 15;
      minutes -= operationOnMinutes * 15;
      operations += operationOnMinutes;
    }

    operationOnMinutes = 0;

    if (minutes >= 5) {
      operationOnMinutes = minutes ~/ 5;
      minutes -= operationOnMinutes * 5;
    }
    operations += operationOnMinutes + minutes;

    return operations;
  }
}
