class Room {
  static const String collectionName = 'rooms';
  String roomId;
  String title;
  String description;
  String catagoryId;

  Room({
    required this.roomId,
    required this.title,
    required this.catagoryId,
    required this.description,
  });

  // Factory constructor to create a Room instance from a JSON object
  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      roomId: json['roomId'] as String,
      title: json['title'] as String,
      catagoryId: json['catagoryId'] as String,
      description: json['description'] as String,
    );
  }

  // Method to convert a Room instance into a JSON object
  Map<String, dynamic> toJson() {
    return {
      'roomId': roomId,
      'title': title,
      'catagoryId': catagoryId,
      'description': description,
    };
  }
}
