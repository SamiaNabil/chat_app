class Message {
  String? content;
  Message({this.content});
  factory Message.fromJson(json){
    return Message(content: json['content']);
  }

}
