import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final double kBubblePadding = 8;
  final BoxConstraints bubbleConstraints = const BoxConstraints(maxWidth: 250);
  final Color backgroundColor = Colors.white;

  final List<Messages> msgs = [
    Messages(content: 'Hey, there', sendByMe: true),
    Messages(content: 'I am fine', sendByMe: true),
    Messages(content: 'What about you?', sendByMe: false),
    Messages(content: 'I am also fine', sendByMe: true),
    Messages(content: 'Nice to hear that', sendByMe: false),
    Messages(content: 'Yeah', sendByMe: true),
    Messages(content: 'How is your day going?', sendByMe: false),
    Messages(content: 'It is going good', sendByMe: true),
    Messages(content: 'Nice', sendByMe: false),
    Messages(content: 'What are you doing?', sendByMe: false),
    Messages(content: 'I am chatting with you', sendByMe: true),
    Messages(content: 'Hey, there', sendByMe: true),
    Messages(content: 'How are you?', sendByMe: false),
    Messages(content: 'I am fine', sendByMe: true),
    Messages(content: 'What about you?', sendByMe: false),
    Messages(content: 'I am also fine', sendByMe: true),
    Messages(content: 'Nice to hear that', sendByMe: false),
    Messages(content: 'Yeah', sendByMe: true),
    Messages(content: 'How is your day going?', sendByMe: false),
    Messages(content: 'It is going good', sendByMe: true),
    Messages(content: 'Nice', sendByMe: false),
    Messages(content: 'What are you doing?', sendByMe: false),
    Messages(content: 'I am chatting with you', sendByMe: true),
    Messages(content: 'Ohh', sendByMe: false),
    Messages(content: 'What are you doing?', sendByMe: true),
    Messages(content: 'I am chatting with you', sendByMe: false),
    Messages(content: 'Ohh', sendByMe: true),
    Messages(content: 'What are you doing?', sendByMe: false),
  ];

  List<Widget> _buildBubbles() {
    final List<Widget> children = <Widget>[];
    for (Messages msg in msgs) {
      children.add(
        Stack(
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                backgroundColor,
                msg.sendByMe ? BlendMode.srcOut : BlendMode.dstATop,
              ),
              child: _buildBubbleLayer(msg.content, isMine: msg.sendByMe),
            ),
            _buildBubbleLayer(msg.content, isMine: msg.sendByMe, showText: true)
          ],
        ),
      );
    }
    return children
      ..add(Expanded(child: Container(color: backgroundColor)))
      ..insert(0, Container(height: 8, color: backgroundColor));
  }

  Widget _buildBubbleLayer(String message, {bool isMine = false, bool showText = false}) {
    return Container(
      width: double.infinity,
      color: showText ? null : Colors.transparent,
      alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: bubbleConstraints,
        margin: const EdgeInsets.fromLTRB(12, 0, 12, 8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: showText ? null : const Color(0xff2b2540),
          ),
          padding: EdgeInsets.all(kBubblePadding),
          child: Text(
            message,
            style: TextStyle(
              color: showText ? Colors.white : Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Chat gradient UI',
          // style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: backgroundColor,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.pinkAccent,
                  Colors.purpleAccent,
                  Colors.blue,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      children: _buildBubbles(),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Messages {
  String content;
  bool sendByMe;

  Messages({required this.content, required this.sendByMe});
}
