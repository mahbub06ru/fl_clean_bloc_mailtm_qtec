import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/strings.dart';
import '../../domain/entities/message.dart';
import '../bloc/remote/message/message_bloc.dart';
import '../bloc/remote/message/message_state.dart';

class MessageListPage extends StatelessWidget {
  const MessageListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle,style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          const Divider(height: 1,),
          Container(
            width: double.infinity,
            height: 50.0,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: const Center(
              child:  Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Text(
                    'mahbub06ru4@gmail.com',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<MessageBloc, MessageState>(
              builder: (context, state) {
                print("Current State: $state");
                if (state is MessageLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is MessageLoaded) {
                  return _buildMessageList(context, state.message);
                } else if (state is MessageError) {
                  return Center(
                    child: Text('Failed!'),
                  );

                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageList(BuildContext context, List<MessageEntity> messages) {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return Card(
          child: ListTile(
            title: Text('Subject: ${message.subject}'),
            subtitle: Text('Body: ${message.intro}'),
            onTap: () {
              // Handle tap on the message
            },
          ),
        );
      },
    );
  }
}
