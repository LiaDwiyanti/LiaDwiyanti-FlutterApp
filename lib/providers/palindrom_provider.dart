import 'package:flutter/material.dart';

class PalindromeProvider extends ChangeNotifier {
  String _name = '';
  String _palindrome = '';

  String get name => _name;
  String get palindrome => _palindrome;

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setPalindrome(String palindrome) {
    _palindrome = palindrome;
    notifyListeners();
  }

  bool isPalindrome() {
    final cleaned = _palindrome.replaceAll(RegExp(r'[\W_]+', caseSensitive: false), '').toLowerCase();
    return cleaned == cleaned.split('').reversed.join('');
  }
}