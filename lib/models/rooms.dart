class Room {
  bool isFree = true;
  int number;
  int capacity;
  String view;
  String type;
  String imagePath;

  Room(
      {required this.isFree,
      required this.number,
      required this.capacity,
      required this.view,
      required this.type,
      required this.imagePath});
}
