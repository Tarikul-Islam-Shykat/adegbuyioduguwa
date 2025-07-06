// models/chat_models.dart

class ChatUser {
  final String id;
  final String name;
  final int age;
  final String avatar;
  final bool isOnline;
  final String lastSeen;

  ChatUser({
    required this.id,
    required this.name,
    required this.age,
    required this.avatar,
    required this.isOnline,
    required this.lastSeen,
  });
}

class ChatMessage {
  final String id;
  final String senderId;
  final String receiverId;
  final String content;
  final DateTime timestamp;
  final MessageType type;
  final bool isRead;

  ChatMessage({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.content,
    required this.timestamp,
    required this.type,
    this.isRead = false,
  });
}

enum MessageType {
  text,
  image,
  voice,
  video,
}

class ChatRoom {
  final String id;
  final List<String> participants;
  final ChatMessage? lastMessage;
  final int unreadCount;
  final DateTime updatedAt;

  ChatRoom({
    required this.id,
    required this.participants,
    this.lastMessage,
    this.unreadCount = 0,
    required this.updatedAt,
  });
}

class ChatListItem {
  final ChatUser user;
  final String lastMessage;
  final String timeAgo;
  final int unreadCount;
  final bool isTyping;
  final MessageType lastMessageType;

  ChatListItem({
    required this.user,
    required this.lastMessage,
    required this.timeAgo,
    this.unreadCount = 0,
    this.isTyping = false,
    this.lastMessageType = MessageType.text,
  });
}
