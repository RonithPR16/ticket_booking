class Ticket {
  int id;
  String fromCityShortform;
  String fromCityFullForm;
  String toCityShortForm;
  String toCityFullForm;
  String day;
  String dateText;
  String time;
  String departureInfo;
  int ticketNumber;
  String numberText;

  Ticket(
      {
      required this.id,
      required this.fromCityShortform,
      required this.fromCityFullForm,
      required this.toCityShortForm,
      required this.toCityFullForm,
      required this.day,
      required this.dateText,
      required this.time,
      required this.departureInfo,
      required this.ticketNumber,
      required this.numberText
      }
  );
}
