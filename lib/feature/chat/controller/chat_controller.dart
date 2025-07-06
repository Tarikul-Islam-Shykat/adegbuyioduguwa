// controllers/chat_controller.dart

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:prettyrini/feature/chat/model/chat_data_model.dart';

class ChatController extends GetxController {
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  // Observable variables
  var messages = <ChatMessage>[].obs;
  var isTyping = false.obs;
  var currentUser = Rxn<ChatUser>();
  var chatPartner = Rxn<ChatUser>();

  @override
  void onInit() {
    super.onInit();
    _initializeDummyData();
    _scrollToBottom();
  }

  void _initializeDummyData() {
    // Current user (sender)
    currentUser.value = ChatUser(
      id: "current_user",
      name: "Me",
      age: 25,
      avatar: "👤",
      isOnline: true,
      lastSeen: "Now",
    );

    // Chat partner
    chatPartner.value = ChatUser(
      id: "alice_18",
      name: "Alice",
      age: 18,
      avatar: "👩",
      isOnline: true,
      lastSeen: "Active",
    );

    // Dummy messages
    messages.value = [
      ChatMessage(
        id: "1",
        senderId: "alice_18",
        receiverId: "current_user",
        content: "Hey, what time are we meeting today?",
        timestamp: DateTime.now().subtract(Duration(minutes: 5)),
        type: MessageType.text,
        isRead: true,
      ),
      ChatMessage(
        id: "2",
        senderId: "alice_18",
        receiverId: "current_user",
        content: "Hey, what time are we meeting today?",
        timestamp: DateTime.now().subtract(Duration(minutes: 4)),
        type: MessageType.text,
        isRead: true,
      ),
      ChatMessage(
        id: "3",
        senderId: "current_user",
        receiverId: "alice_18",
        content: "Hey, what time are we meeting today?",
        timestamp: DateTime.now().subtract(Duration(minutes: 3)),
        type: MessageType.text,
        isRead: true,
      ),
    ];
  }

  void sendMessage() {
    if (messageController.text.trim().isEmpty) return;

    final message = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      senderId: currentUser.value!.id,
      receiverId: chatPartner.value!.id,
      content: messageController.text.trim(),
      timestamp: DateTime.now(),
      type: MessageType.text,
    );

    messages.add(message);
    messageController.clear();
    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  String formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays == 0) {
      return "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
    } else if (difference.inDays == 1) {
      return "Yesterday";
    } else {
      return "${dateTime.day}/${dateTime.month}/${dateTime.year}";
    }
  }

  bool isMyMessage(String senderId) {
    return senderId == currentUser.value?.id;
  }

  @override
  void onClose() {
    messageController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}
