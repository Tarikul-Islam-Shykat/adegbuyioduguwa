// screens/chat_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prettyrini/feature/chat/controller/chat_controller.dart';
import 'package:prettyrini/feature/chat/model/chat_data_model.dart';

class ChatScreen extends StatelessWidget {
  final ChatController controller = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    // Get chat partner from arguments
    final arguments = Get.arguments as Map<String, dynamic>?;
    if (arguments != null) {
      controller.chatPartner.value = arguments['chatPartner'] as ChatUser;
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildDateHeader(),
          Expanded(
            child: _buildMessagesList(),
          ),
          _buildMessageInput(),
        ],
      ),
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
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Get.back(),
                ),
                Obx(() => CircleAvatar(
                      radius: 20.r,
                      backgroundColor: Colors.white.withOpacity(0.2),
                      child: Text(
                        controller.chatPartner.value?.avatar ?? '👤',
                        style: TextStyle(fontSize: 18.sp),
                      ),
                    )),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() => Text(
                            '${controller.chatPartner.value?.name ?? 'Unknown'}, ${controller.chatPartner.value?.age ?? 0}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                      Obx(() => Text(
                            controller.chatPartner.value?.lastSeen ?? 'Offline',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 12.sp,
                            ),
                          )),
                    ],
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

  Widget _buildDateHeader() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Text(
          'Sat, Feb 28, 9:41',
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildMessagesList() {
    return Obx(() => ListView.builder(
          controller: controller.scrollController,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          itemCount: controller.messages.length,
          itemBuilder: (context, index) {
            final message = controller.messages[index];
            final isMyMessage = controller.isMyMessage(message.senderId);

            return _buildMessageBubble(message, isMyMessage);
          },
        ));
  }

  Widget _buildMessageBubble(ChatMessage message, bool isMyMessage) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        mainAxisAlignment:
            isMyMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isMyMessage) ...[
            CircleAvatar(
              radius: 16.r,
              backgroundColor: Colors.grey.shade200,
              child: Text(
                controller.chatPartner.value?.avatar ?? '👤',
                style: TextStyle(fontSize: 14.sp),
              ),
            ),
            SizedBox(width: 8.w),
          ],
          Flexible(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: Get.width * 0.75,
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: isMyMessage ? Color(0xFF007AFF) : Colors.grey.shade200,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                  bottomLeft: isMyMessage
                      ? Radius.circular(20.r)
                      : Radius.circular(4.r),
                  bottomRight: isMyMessage
                      ? Radius.circular(4.r)
                      : Radius.circular(20.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.content,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: isMyMessage ? Colors.white : Colors.black,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      controller.formatTime(message.timestamp),
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: isMyMessage
                            ? Colors.white.withOpacity(0.7)
                            : Colors.grey.shade600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isMyMessage) ...[
            SizedBox(width: 8.w),
            CircleAvatar(
              radius: 16.r,
              backgroundColor: Colors.grey.shade200,
              child: Text(
                '👤',
                style: TextStyle(fontSize: 14.sp),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: TextField(
                  controller: controller.messageController,
                  decoration: InputDecoration(
                    hintText: 'Type a message...',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 16.sp,
                    ),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                  ),
                  style: TextStyle(fontSize: 16.sp),
                  onSubmitted: (_) => controller.sendMessage(),
                ),
              ),
            ),
            SizedBox(width: 8.w),
            GestureDetector(
              onTap: controller.sendMessage,
              child: Container(
                width: 48.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: Color(0xFF007AFF),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.send,
                  color: Colors.white,
                  size: 20.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
