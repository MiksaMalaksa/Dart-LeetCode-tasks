class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
    ListNode? newNode;
    ListNode? ans;
    int trans = 0;
    int add = 0;

    while (l1 != null && l2 != null) {
      int? val1 = l1.val;
      int? val2 = l2.val;

      add = val1 + val2 + trans < 10
          ? val1 + val2 + trans
          : (val1 + val2 + trans) % 10;

      if ((val1 + val2 + trans) > 10 || (val1 + val2 + trans) < 10) trans = 0;
      trans = val1 + val2 + trans < 10 ? trans : (val1 + val2) ~/ 10 + trans;

      if (newNode == null) {
        newNode = ListNode(add);
        ans = newNode;
      } else {
        newNode.next = ListNode(add);
        newNode = newNode.next;
      }

      if (l1.next == null && l2.next != null) {
        l1.next = ListNode(0);
      } else if (l2.next == null && l1.next != null) {
        l2.next = ListNode(0);
      } else if (l1.next == null && l2.next == null) {
        break;
      }

      l1 = l1.next;
      l2 = l2.next;
    }

    if (trans != 0) newNode?.next = ListNode(trans);

    return ans;
  }
}
