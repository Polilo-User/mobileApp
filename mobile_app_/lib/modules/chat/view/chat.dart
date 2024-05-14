

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import '../../../repositories/chat_repository/chat_repository.dart';
import '../../../repositories/chat_repository/models/message.dart';

class Chat extends StatefulWidget {
  const Chat({ Key? key }) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  final chatRepository = GetIt.I<ChatRepository>();
  final messContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final thm = Theme.of(context);
    return
      Scaffold(
        body:
          Column(
            children: [
                Container(
                  child: Expanded(
                    child: ListView.builder(
                    itemCount: chatRepository.messages.length,
                    itemBuilder: (context, index) { // Text(chatRepository.messages[index].text)
                      if (chatRepository.messages[index].User == "User") {
                        return Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                top: 5,
                                bottom: 5,
                                left: 15,
                                right: 15,
                              ),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(124, 173, 201, 1.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.05,
                                top: MediaQuery.of(context).size.height * 0.01
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${chatRepository.messages[index].User}:", style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 20,
                                    color: Color.fromRGBO(255, 255, 255, 1.0),
                                  )),
                                  Text(chatRepository.messages[index].text, style: const TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 20,
                                    color: Color.fromRGBO(245, 245, 245, 1.0),
                                  )),
                                ]
                              )
                            ),
                          ],
                        );

                      }
                      return Row(
                        children: [
                          Container(
                              padding: const EdgeInsets.only(
                                top: 5,
                                bottom: 5,
                                left: 15,
                                right: 15,
                              ),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(124, 201, 137, 1.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.05,
                                  top: MediaQuery.of(context).size.height * 0.01
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${chatRepository.messages[index].User}:", style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 20,
                                      color: Color.fromRGBO(255, 255, 255, 1.0),
                                    )),
                                    Text(chatRepository.messages[index].text, style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 20,
                                      color: Color.fromRGBO(245, 245, 245, 1.0),
                                    )),
                                  ]
                              )
                          ),
                        ],
                      );
                    },
                  )
                )
              )
            ]
          ),
          bottomNavigationBar:
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.01,
                    right: MediaQuery.of(context).size.width * 0.01,
                    bottom: MediaQuery.of(context).size.height * 0.02
                ),
                child:
                  Row(
                    children: [
                      Expanded(child:
                        TextField(
                            controller: messContoller,
                            decoration: InputDecoration(

                              border:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: " Сообщение",
                            ),
                            style: thm.textTheme.displayMedium,
                            maxLines: 5,
                            minLines: 1
                          )
                        ),
                          InkWell(
                          child: Icon(Icons.navigate_next, size: 40,),
                          onTap: () {
                            chatRepository.messages.add(Message(text: messContoller.text, User: "User"));
                            messContoller.text = "";

                            List<String> answers = [
                              "Спасибо за ваще мнение !",
                              "Привет !",
                              "Потом потключим к api Chat gpt",
                              "Этото сообщение просто огонь 🔥🔥🔥",
                              "Наш ЖК лучший в мире 😎",
                            ];
                            chatRepository.messages.add(Message(text: answers[Random().nextInt(answers.length)], User: "Консультант"));
                            setState(() {});
                          },
                        )
                    ],
                  )
              ),
        );
    }
}

