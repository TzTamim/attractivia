import 'package:attractivia/features/home/data/home_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/text_font_style.dart';
import '../../../gen/colors.gen.dart';
import '../../../helpers/ui_helpers.dart';
import 'package:attractivia/features/home/presentation/widget/gradient_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool isTyping = false;
  bool isGenerating = false;

  final List<Map<String, dynamic>> _messages = [];


  @override
  void initState() {
    super.initState();
    _messageController.addListener(() {
      if (mounted) {
        setState(() {
          isTyping = _messageController.text.trim().isNotEmpty;
        });
      }
    });
  }


 void _sendMessage() {
  if (_messageController.text.trim().isEmpty) return;

  final userMessage = _messageController.text.trim();

  setState(() {
    _messages.add({"role": "user", "message": userMessage});
    _messageController.clear();
    isGenerating = true;
    isTyping = false;
  });

  _scrollToBottom();

  Future.delayed(const Duration(seconds: 1), () {
    if (!mounted) return;

    String reply = BotReplies.replies.entries
        .firstWhere(
          (entry) => userMessage.toLowerCase().contains(entry.key),
          orElse: () => const MapEntry("default", "I have no answer for this question 🙂"),
        )
        .value;

    setState(() {
      isGenerating = false;
      _messages.add({"role": "bot", "message": reply});
    });

    _scrollToBottom();
  });
}


  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool hasMessages = _messages.isNotEmpty || isGenerating;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    if (!hasMessages) ...[
                      UIHelper.verticalSpace(60.h),
                      _buildWelcomeView(),
                    ] else ...[
                      UIHelper.verticalSpace(10.h),
                      _buildChatActionButtons(),
                    ],
                    Expanded(
                      child: ListView.builder(
                        controller: _scrollController,
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        itemCount: _messages.length + (isGenerating ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index == _messages.length && isGenerating) {
                            return _buildBotLoading();
                          }
                          final chat = _messages[index];
                          return _buildChatBubble(chat['role'], chat['message']);
                        },
                      ),
                    ),
                    if (!hasMessages) _buildQuickSuggestions(),
                  ],
                ),
              ),
            ),
            _buildInputSection(),
            UIHelper.verticalSpace(15.h),
          ],
        ),
      ),
    );
  }

  Widget _buildInputSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 54.h,
              decoration: BoxDecoration(
                color: const Color(0xFFF4F4F4),
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Row(
                children: [
                  UIHelper.horizontalSpace(10.w),
                  CircleAvatar(
                    radius: 18.r,
                    backgroundColor: Colors.black.withOpacity(0.05),
                    child: Icon(Icons.add, color: Colors.grey, size: 20.sp),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: "Message",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 16.sp),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12.w),
                      ),
                    ),
                  ),
                  Icon(Icons.mic_none,
                      color: Colors.grey, size: 24.sp),
                  UIHelper.horizontalSpace(15.w),
                ],
              ),
            ),
          ),
          UIHelper.horizontalSpace(10.w),
          GestureDetector(
            onTap: _sendMessage,
            child: CircleAvatar(
              radius: 26.r,
              backgroundColor:
                  isTyping ? AppColors.c1877F2 : const Color(0xFFE0E0E0),
              child: Icon(Icons.arrow_upward,
                  color: Colors.white, size: 26.sp),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatBubble(String role, String message) {
    bool isUser = role == "user";
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser) ...[
            const Icon(Icons.smart_toy,
                color: Colors.blue, size: 24),
            UIHelper.horizontalSpace(8.w),
          ],
          Flexible(
            child: Container(
              padding: EdgeInsets.all(14.w),
              decoration: BoxDecoration(
                color:
                    isUser ? AppColors.c1877F2 : const Color(0xFFF8F9FB),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                  bottomLeft:
                      isUser ? Radius.circular(16.r) : Radius.circular(0),
                  bottomRight:
                      isUser ? Radius.circular(0) : Radius.circular(16.r),
                ),
              ),
              child: Text(
                message,
                style: TextStyle(
                    color: isUser ? Colors.white : Colors.black87,
                    fontSize: 14.sp,
                    height: 1.4),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomeView() {
    return Column(
      children: [
        Image.asset('assets/images/chat.png', height: 120.h),
        UIHelper.verticalSpace(30.h),
        Text(
          'Hello, how can I help you \ntoday?',
          textAlign: TextAlign.center,
          style: TextFontStyle.textStyle24c1877F2Inter700Bold,
        ),
        UIHelper.verticalSpace(12.h),
        Text(
          'Get legal advice in 15 seconds or less',
          textAlign: TextAlign.center,
          style: TextFontStyle.textStyle16c737373InterRegular400,
        ),
      ],
    );
  }

  Widget _buildQuickSuggestions() {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: const [
            GradientCard(title: 'Lease Issue'),
            GradientCard(title: 'Contract Dispute'),
            GradientCard(title: 'Land Dispute'),
          ],
        ),
      ),
    );
  }

  Widget _buildChatActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _actionBtn(Icons.edit_note, "New Chat",
            () => setState(() => _messages.clear())),
        Row(
          children: [
            _actionBtn(Icons.save_outlined, "Save", () {}),
            UIHelper.horizontalSpace(8.w),
            _actionBtn(Icons.picture_as_pdf_outlined, "PDF", () {}),
          ],
        )
      ],
    );
  }

  Widget _actionBtn(
      IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(20.r)),
        child: Row(children: [
          Text(label, style: TextStyle(fontSize: 12.sp)),
          UIHelper.horizontalSpace(4.w),
          Icon(icon, size: 16.sp)
        ]),
      ),
    );
  }

  Widget _buildBotLoading() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          const Icon(Icons.smart_toy_outlined, color: Colors.blue),
          UIHelper.horizontalSpace(8.w),
          Text("Typing...",
              style:
                  TextStyle(fontSize: 14.sp, color: Colors.grey)),
        ],
      ),
    );
  }
}
