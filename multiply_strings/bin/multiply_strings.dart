import 'dart:math';

void main(List<String> arguments) {
  Solution solution = Solution();
  final a = min("num1".length, "num22".length);


  String num = solution.multiply("12", "9762346374865236763476327472377473476");


  print(num);
}

class Solution {
  String adding(String num1, String num2) {
    List<String> numbers = [];
    int maxSymbols = max(num1.length, num2.length);
    int transfer = 0;

    if (num2.length < num1.length) {
      num2 = num2.padLeft(num1.length - num2.length + num2.length, "0");
    } else if (num1.length < num2.length) {
      num1 = num1.padLeft(num2.length - num1.length + num1.length, "0");
    }

    for (int i = maxSymbols - 1; i >= 0; i--) {
      String add = int.parse(num1[i]) + int.parse(num2[i]) + transfer < 10
          ? (int.parse(num1[i]) + int.parse(num2[i]) + transfer).toString()
          : ((int.parse(num1[i]) + int.parse(num2[i]) + transfer) % 10)
              .toString();
      if (int.parse(num1[i]) + int.parse(num2[i]) + transfer < 10) transfer = 0;
      transfer = int.parse(num1[i]) + int.parse(num2[i]) + transfer < 10
          ? 0
          : (int.parse(num1[i]) + int.parse(num2[i]) + transfer) ~/ 10;

      numbers.add(add);
    }

    if (transfer != 0) {
      numbers.add(transfer.toString());
    }

    return numbers.reversed.join();
  }

  String multiply(String num1, String num2) {
    List<String> sum = [];
    int maxSymbols = max(num1.length, num2.length);
    int transfer = 0;

    if (num2.length < num1.length) {
      num2 = num2.padLeft(num1.length - num2.length + num2.length, "0");
    } else if (num1.length < num2.length) {
      num1 = num1.padLeft(num2.length - num1.length + num1.length, "0");
    }

    for (int i = maxSymbols - 1; i >= 0; i--) {
      List<String> numbers = [];
      for (int j = maxSymbols - 1; j >= 0; j--) {
        String multiply = int.parse(num1[j]) * int.parse(num2[i]) + transfer <
                10
            ? (int.parse(num1[j]) * int.parse(num2[i]) + transfer).toString()
            : ((int.parse(num1[j]) * int.parse(num2[i]) + transfer) % 10)
                .toString();
        if (int.parse(num1[j]) * int.parse(num2[i]) + transfer < 10)
          transfer = 0;
        transfer = int.parse(num1[j]) * int.parse(num2[i]) + transfer < 10
            ? 0
            : (int.parse(num1[j]) * int.parse(num2[i]) + transfer) ~/ 10;

        numbers.add(multiply);
      }

      if (transfer != 0) {
        numbers.add(transfer.toString());
        transfer = 0;
      }

      sum.add(numbers.reversed.join());
    }

    String stringSum = "0";
    for (int i = 0; i < sum.length; i++) {
      for (int j = 0; j < sum[i].length - 1; j++) {
        if (sum[i].startsWith("0")) {
          sum[i] = sum[i].replaceFirst(RegExp(r'0'), '');
          j--;
        } else {
          break;
        }
      }
      String addTimes = sum[i].padRight(i + sum[i].length, "0");
      stringSum = adding(stringSum, addTimes);
    }

    for (int j = 0; j < stringSum.length - 1; j++) {
      if (stringSum.startsWith("0")) {
        stringSum = stringSum.replaceFirst(RegExp(r'0'), '');
        j--;
      }
    }

    return stringSum;
  }
}
