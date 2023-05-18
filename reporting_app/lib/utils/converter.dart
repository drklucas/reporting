// ignore_for_file: non_constant_identifier_names

class Converter {
  static String string_date_formatter(String receivedDate) {
    var split = receivedDate.split('/'); 
    return '${split[2]}-${split[1]}-${split[0]}'; 
  }
}