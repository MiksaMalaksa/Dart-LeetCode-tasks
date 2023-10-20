import 'package:add_two_numbers/add_two_numbers.dart';

void main(List<String> arguments) {
  // Создаем первый список с 7 девятками
  ListNode? noda1 = ListNode(9);
  for (int i = 0; i < 6; i++) {
    noda1 = ListNode(9, noda1);
  }

  // Создаем второй список с 4 девятками
  ListNode? noda2 = ListNode(9);
  for (int i = 0; i < 3; i++) {
    noda2 = ListNode(9, noda2);
  }

  // Вызываем функцию сложения
  Solution solution = Solution();
  ListNode? result = solution.addTwoNumbers(noda1, noda2);

  // Выводим результат
  while (result != null) {
    print(result.val);
    result = result.next;
  }
}



// ListNode? noda1 = ListNode(2);
//   noda1.next = ListNode(4);
//   noda1.next!.next = ListNode(3);

//   // Создаем второй список с 4 девятками
//      ListNode? noda2 = ListNode(5);
//   noda2.next = ListNode(6);
//   noda2.next!.next = ListNode(4);