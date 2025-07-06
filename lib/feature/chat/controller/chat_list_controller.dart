// controllers/chat_list_controller.dart

import 'package:get/get.dart';
import 'package:prettyrini/feature/chat/model/chat_data_model.dart';

class ChatListController extends GetxController {
  var chatList = <ChatListItem>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadChatList();
  }

  void _loadChatList() {
    isLoading.value = true;

    // Simulate loading delay
    Future.delayed(Duration(milliseconds: 500), () {
      chatList.value = [
        ChatListItem(
          user: ChatUser(
            id: "alice_1",
            name: "Alice",
            age: 18,
            avatar: "👩‍🦰",
            isOnline: true,
            lastSeen: "Now",
          ),
          lastMessage: "Kinda nothing, just playing Fortnite atm",
          timeAgo: "Now",
          unreadCount: 1,
        ),
        ChatListItem(
          user: ChatUser(
            id: "alice_2",
            name: "Alice",
            age: 18,
            avatar: "👦",
            isOnline: false,
            lastSeen: "2min",
          ),
          lastMessage: "Typing...",
          timeAgo: "2min",
          isTyping: true,
        ),
        ChatListItem(
          user: ChatUser(
            id: "alice_3",
            name: "Alice",
            age: 18,
            avatar: "👱‍♀️",
            isOnline: false,
            lastSeen: "Now",
          ),
          lastMessage: "Photo",
          timeAgo: "Now",
          unreadCount: 1,
          lastMessageType: MessageType.image,
        ),
        ChatListItem(
          user: ChatUser(
            id: "alice_4",
            name: "Alice",
            age: 18,
            avatar: "👩‍🦳",
            isOnline: false,
            lastSeen: "2min",
          ),
          lastMessage: "Don't mess with me",
          timeAgo: "2min",
        ),
        ChatListItem(
          user: ChatUser(
            id: "alice_5",
            name: "Alice",
            age: 18,
            avatar: "👩‍🦳",
            isOnline: false,
            lastSeen: "2min",
          ),
          lastMessage: "Don't mess with me",
          timeAgo: "2min",
        ),
        ChatListItem(
          user: ChatUser(
            id: "alice_6",
            name: "Alice",
            age: 18,
            avatar: "👨‍🦱",
            isOnline: false,
            lastSeen: "2min",
          ),
          lastMessage: "Don't mess with me",
          timeAgo: "2min",
        ),
        ChatListItem(
          user: ChatUser(
            id: "alice_7",
            name: "Alice",
            age: 18,
            avatar: "👩‍🦰",
            isOnline: false,
            lastSeen: "2min",
          ),
          lastMessage: "Don't mess with me",
          timeAgo: "2min",
        ),
        ChatListItem(
          user: ChatUser(
            id: "alice_8",
            name: "Alice",
            age: 18,
            avatar: "👩‍🦱",
            isOnline: false,
            lastSeen: "2min",
          ),
          lastMessage: "Don't mess with me",
          timeAgo: "2min",
        ),
        ChatListItem(
          user: ChatUser(
            id: "alice_9",
            name: "Alice",
            age: 18,
            avatar: "👩‍🦳",
            isOnline: false,
            lastSeen: "2min",
          ),
          lastMessage: "Don't mess with me",
          timeAgo: "2min",
        ),
      ];

      isLoading.value = false;
    });
  }

  void openChat(ChatListItem chatItem) {
    Get.toNamed('/chat', arguments: {
      'chatPartner': chatItem.user,
      'chatId': chatItem.user.id,
    });
  }
}
