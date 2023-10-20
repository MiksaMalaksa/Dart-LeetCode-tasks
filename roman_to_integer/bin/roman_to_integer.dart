import 'package:roman_to_integer/roman_to_integer.dart' as roman_to_integer;

void main(List<String> arguments) {
  SolutionNotMine solution = SolutionNotMine();
  int ans = solution.romanToInt("IV");
  print(ans);
}

class Solution {
int romanToInt(String s) {
  Map<String, int> values = {
    'I': 1,
    'V': 5,
    'X': 10,
    'L': 50,
    'C': 100,
    'D': 500,
    'M': 1000
  };

  int ans = 0;
  for (int i = 0; i < s.length; i++) {
    int currentValue = values[s[i]]!;
    int? nextValue = (i + 1 < s.length) ? values[s[i + 1]] : 0;

    if (currentValue < nextValue!) {
      ans += nextValue - currentValue;
      i++;
    } 
    else
    {
      ans += currentValue;
    }
  }

  return ans;
}
}

//check
class SolutionNotMine {
  int romanToInt(String s) {
    final romans = <String, int>{
      'IV': 4,
      'IX': 9,
      'XL': 40,
      'XC': 90,
      'CD': 400,
      'CM': 900,
      'I': 1,
      'V': 5,
      'X': 10,
      'L': 50,
      'C': 100,
      'D': 500,
      'M': 1000,
    };

    int result = 0;
  
    for (final roman in romans.entries) {
      //Get count of roman number in string
      final count = roman.key.allMatches(s).length;

      //Multiply count to value
      result += roman.value * count;
      //Remove the Roman number from the string so as dont repeat I in IV and IX, etc.
      s = s.replaceAll(roman.key, '');
    }

    return result;
  }
}
