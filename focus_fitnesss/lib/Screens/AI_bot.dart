import 'dart:io';
import 'dart:typed_data';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:image_picker/image_picker.dart';

class GymBot extends StatefulWidget {
  const GymBot({super.key});

  @override
  State<GymBot> createState() => _GymBotState();
}

class _GymBotState extends State<GymBot> {
  final Gemini gemini = Gemini.instance;

  List<ChatMessage> messages = [];

  ChatUser currentuser = ChatUser(id: '0', firstName: 'User');
  ChatUser geminiuser = ChatUser(
    id: '1',
    firstName: 'Gym Bot',
    profileImage:
        "https://i.pinimg.com/736x/89/c2/ec/89c2ecf1aee613f929c601b49b2413cc.jpg",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 35, 35, 35),
        centerTitle: true,
        title: const Text(
          "GymBot",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          iconSize: 25,
          color: Colors.white,
        ),
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return DashChat(
      inputOptions: InputOptions(
        trailing: [
          IconButton(
            onPressed: _sendMediaMessage,
            icon: const Icon(
              Icons.image,
              color: const Color.fromARGB(255, 255, 94, 94),
            ),
          ),
        ],
        inputDecoration: InputDecoration(
          fillColor: Color.fromARGB(255, 118, 118, 118),
          filled: true,
          hintText: "Ask from GymBot",
          hintStyle: const TextStyle(
              color: Color.fromARGB(255, 219, 219, 219),
              fontWeight: FontWeight.w600),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: const Color.fromARGB(255, 255, 94, 94),
            ),
          ),
        ),
        inputTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 17,
        ),
        cursorStyle: CursorStyle(
          color: Color.fromARGB(255, 255, 94, 94),
        ),
        sendButtonBuilder: (sendMessage) {
          return IconButton(
            onPressed: sendMessage,
            icon: const Icon(
              Icons.send,
              color: const Color.fromARGB(255, 255, 94, 94),
            ),
          );
        },
      ),
      currentUser: currentuser,
      onSend: _sendText,
      messages: messages,
      messageOptions: MessageOptions(
        currentUserContainerColor: const Color.fromARGB(255, 255, 94, 94),
        containerColor: const Color(0xFF353535),
        textColor: Colors.white,
        currentUserTextColor: Colors.white,
      ),
    );
  }

  void _sendText(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
    });
    try {
      String question = chatMessage.text;
      List<Uint8List>? images;

      if (chatMessage.medias?.isNotEmpty ?? false) {
        images = [
          File(chatMessage.medias!.first.url).readAsBytesSync(),
        ];
      }
      gemini
          .streamGenerateContent(
        question,
        images: images,
      )
          .listen(
        (event) {
          ChatMessage? lastMessage = messages.firstOrNull;
          if (lastMessage != null && lastMessage.user == geminiuser) {
            lastMessage = messages.removeAt(0);
            String response = event.content?.parts?.fold(
                    "", (previous, current) => "$previous ${current.text}") ??
                "";
            lastMessage.text += response;
            setState(() {
              messages = [lastMessage!, ...messages];
            });
          } else {
            String response = event.content?.parts?.fold(
                    "", (previous, current) => "$previous ${current.text}") ??
                "";
            ChatMessage message = ChatMessage(
                user: geminiuser, createdAt: DateTime.now(), text: response);
            setState(() {
              messages = [message, ...messages];
            });
          }
        },
      );
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  void _sendMediaMessage() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      ChatMessage chatMessage = ChatMessage(
        user: currentuser,
        createdAt: DateTime.now(),
        text: "Describe this picture",
        medias: [
          ChatMedia(url: file.path, fileName: "", type: MediaType.image),
        ],
      );
      _sendText(chatMessage);
    }
  }
}
