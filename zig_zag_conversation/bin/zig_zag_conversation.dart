void main() {
  Solution sol = Solution();
  print(sol.convert("A", 3));
}

// Input: s = "PAYPALISHIRING", numRows = 3
// Output: "PAHNAPLSIIGYIR"
// OOOOOO: "PAHNAPLSIIGYIR"

class Solution {
  String convert(String s, int numRows) {
    if (s.length <= numRows || numRows == 1) {
      return s;
    }

    List<String> answer = List.filled(numRows, "");
    int lines = 0;
    bool down = true;

    for (int i = 0; i < s.length; i++) {
      answer[lines] = "${answer[lines]}${s[i]}";

      if (lines == 0 || down) {
        lines++;
        down = true;
        if (lines % numRows == 0) {
          lines--;
          down = false;
        }
      } 
      
      if (!down) {
        lines--;
        if (lines == 0) {
          down == false;
        }
      }
    }

    return answer.join();
  }
}
