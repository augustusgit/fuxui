class ChatMessage {
  ChatMessage(
      {required this.messageContent,
      required this.messageType,
      required this.messageTime,
      this.sendersPicture});

  String messageContent;
  String messageType;
  String messageTime;
  String? sendersPicture;
}

List<ChatMessage> messages = [
  ChatMessage(
      messageContent: "Are the Designs ready yet?",
      messageType: "sender",
      messageTime: ""),
  ChatMessage(
      messageContent: "No, but i bought the camera",
      messageType: "receiver",
      messageTime: ""),
  ChatMessage(
      messageContent: "How have you been",
      messageType: "sender",
      messageTime: ""),
  ChatMessage(
      messageContent: "Hey bro, I am doing fine . wbu?",
      messageType: "receiver",
      messageTime: ""),
  ChatMessage(
      messageContent: "Doing good too", messageType: "sender", messageTime: ""),
];
