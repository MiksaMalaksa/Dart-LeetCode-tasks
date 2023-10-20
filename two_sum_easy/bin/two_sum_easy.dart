void main(List<String> arguments) {
  List<int> oka = [3,3];
  Solution taska = Solution();

  final answer = taska.twoSum(oka, 6);
  print(answer);
}

class Solution {
  List<int> twoSum(List<int> nums, int target) {
    final map = <int, int>{};

    for (int i = 0; i < nums.length; i++) {
      int remain = target - nums[i];
      if (map.containsKey(remain)) {
        return [map[remain]!, i];
      }
      map[nums[i]] = i;
    }

    return [];
  }
}
