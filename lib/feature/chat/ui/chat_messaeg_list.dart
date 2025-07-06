// screens/chat_list_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prettyrini/feature/chat/controller/chat_list_controller.dart';
import 'package:prettyrini/feature/chat/model/chat_data_model.dart';

class ChatListScreen extends StatelessWidget {
  final ChatListController controller = Get.put(ChatListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: controller.chatList.length,
          itemBuilder: (context, index) {
            final chatItem = controller.chatList[index];
            return _buildChatItem(chatItem);
          },
        );
      }),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(100.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF007AFF),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Get.back(),
                ),
                Text(
                  'My chat',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.notifications_outlined,
                          color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.shopping_cart_outlined,
                          color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChatItem(ChatListItem chatItem) {
    return InkWell(
      onTap: () => controller.openChat(chatItem),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.shade200,
              width: 0.5,
            ),
          ),
        ),
        child: Row(
          children: [
            // Avatar with online indicator
            Stack(
              children: [
                CircleAvatar(
                  radius: 25.r,
                  backgroundColor: Colors.grey.shade200,
                  child: Text(
                    chatItem.user.avatar,
                    style: TextStyle(fontSize: 20.sp),
                  ),
                ),
                if (chatItem.user.isOnline)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 12.w,
                      height: 12.h,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(width: 12.w),
            // Chat content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${chatItem.user.name}, ${chatItem.user.age}',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        chatItem.timeAgo,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          chatItem.isTyping
                              ? 'Typing...'
                              : _getLastMessageText(chatItem),
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: chatItem.isTyping
                                ? Color(0xFF007AFF)
                                : Colors.grey.shade600,
                            fontStyle: chatItem.isTyping
                                ? FontStyle.italic
                                : FontStyle.normal,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (chatItem.unreadCount > 0)
                        Container(
                          margin: EdgeInsets.only(left: 8.w),
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: Color(0xFF007AFF),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            chatItem.unreadCount.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getLastMessageText(ChatListItem chatItem) {
    switch (chatItem.lastMessageType) {
      case MessageType.image:
        return 'Photo';
      case MessageType.voice:
        return 'Voice message';
      case MessageType.video:
        return 'Video';
      default:
        return chatItem.lastMessage;
    }
  }
}
