class Validator {
  static bool name(String input) =>
      (input.trim().isNotEmpty && input.trim().length <= 50);
  static bool select(String input) => (input.trim().isNotEmpty);
}
