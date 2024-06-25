class Message {
  String? id;
  String? toId;
  String? fromId;
  String? msg;
  String? type;
  String? createdAt;
  String? read;

  Message({
    required this.id,
    required this.toId,
    required this.fromId,
    required this.msg,
    required this.type,
    required this.createdAt,
    required this.read,
  });
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'] ?? '',
      toId: json['toId'] ?? '',
      fromId: json['fromId'] ?? '',
      msg: json['msg'] ?? '',
      type: json['type'] ?? '',
      createdAt: json['createdAt'] ?? '',
      read: json['read'] ?? "",
    );
  }

  Map<String, dynamic> toJSon() {
    return {
      'id': id,
      'toId': toId,
      'fromId': fromId,
      'msg': msg,
      'type': type,
      'createdAt': createdAt,
      'read': read,
    };
  }
}
