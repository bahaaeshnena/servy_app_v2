class ChatRoomModel {
  String? id;
  List? members;
  String? lastMessage;
  String? lastMessageTime;
  String? createdAt;

  ChatRoomModel({
    required this.id,
    required this.members,
    required this.createdAt,
    required this.lastMessage,
    required this.lastMessageTime,
  });
  factory ChatRoomModel.fromJson(Map<String, dynamic> json) {
    return ChatRoomModel(
      id: json['id'] ?? '',
      members: json['members'] ?? [],
      createdAt: json['createdAt'] ?? '',
      lastMessage: json['lastMessage'] ?? '',
      lastMessageTime: json['lastMessageTime'] ?? '',
    );
  }

  Map<String, dynamic> toJSon() {
    return {
      'id': id,
      'members': members,
      'createdAt': createdAt,
      'lastMessage': lastMessage,
      'lastMessageTime': lastMessageTime,
    };
  }
}
