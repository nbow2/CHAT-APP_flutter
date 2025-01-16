class Massage {
  static const String CollectionName = 'massage';
  String roomId;
  String id;
  String content;
  String senderId;
  String senderName;
  String dataTime;
  int time;

  Massage({
    this.id = '',
    required this.roomId,
    required this.content,
    required this.senderId,
    required this.senderName,
    required this.dataTime,
    required this.time
  });

  // Factory constructor to create a Massage instance from a JSON object
  factory Massage.fromJson(Map<String, dynamic> json) {
    return Massage(
      id: json['id'] ?? '' as String , // Default value if `id` is missing
      roomId: json['roomId'] as String ,
      content: json['content'] as String ,
      senderId: json['senderId'] as String ,
      senderName: json['senderName'] as String ,
      dataTime: json['dataTime'] as String,
      time:  json['time']  ?? 0 as int
    );
  }

  // Method to convert a Massage instance into a JSON object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'roomId': roomId,
      'content': content,
      'senderId': senderId,
      'senderName': senderName,
      'dataTime': dataTime,
      'time': time
    };
  }
}
