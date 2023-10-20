void main(List<String> arguments) {
  List<List<int>> points = [[3,9],[7,12],[3,8],[6,8],[9,10],[2,9],[0,9],[3,9],[0,6],[2,8]];
  Solution solution = Solution();
  print(solution.findMinArrowShots(points));
}

class Solution {
  int findMinArrowShots(List<List<int>> points) {
    points.sort((a, b) => a[1].compareTo(b[1]));
    print(points);
    int arrow = 1;
    int pointer = points[0][1];

    for (int i = 0; i < points.length; i++) {
      if (pointer >= points[i][0] && pointer <= points[i][1]) {
        continue;
      } else {
        pointer = points[i][1];
        arrow++;
      }
    }

    return arrow;
  }
}
