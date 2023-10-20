void main(List<String> arguments) {
  Solution solution = Solution();
  bool ans = solution.isPalindrome(1341);
  print(ans);
}

class Solution {
  bool isPalindrome(int x) {
    bool palindrom = true;

    if (x < 0) {
      return false;
    }

    String number = x.toString();
    int through = (number.length / 2).round();

    for (int i = 0; i < through; i++) {
      if (number[i] != number[number.length - 1 - i]) {
        palindrom = false;
      }
    }
    return palindrom;
  }
}
