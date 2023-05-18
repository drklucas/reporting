// ignore_for_file: non_constant_identifier_names

class Comparator {
  static bool is_after_today(String stringDate) {
    var splitted = stringDate.split("/");
    DateTime date =
        DateTime.parse("${splitted[2]}-${splitted[1]}-${splitted[0]}");
    bool is_after = date.isAfter(DateTime.now());

    return is_after;
  }

  static has_legal_age(String stringDate) {
    var splitted = stringDate.split("/");
    DateTime date =
        DateTime.parse("${splitted[2]}-${splitted[1]}-${splitted[0]}");
    DateTime birth_legal_age = DateTime.now().subtract(const Duration(days: 6574, hours: 12));
    
    bool has_legal_age = birth_legal_age.isAfter(date);

    return has_legal_age;
  }
}
