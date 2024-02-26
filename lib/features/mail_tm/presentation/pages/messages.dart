import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/message.dart';
import '../bloc/remote/message/message_bloc.dart';
import '../bloc/remote/message/message_state.dart';

class MessageListPage extends StatelessWidget {
  const MessageListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Message List'),
      ),
      body: BlocBuilder<MessageBloc, MessageState>(
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
    );
  }

  Widget _buildMessageList(BuildContext context, List<MessageEntity> messages) {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return ListTile(
          title: Text(message.subject),
          subtitle: Text(message.intro),
          onTap: () {
            // Handle tap on the message
          },
        );
      },
    );
  }
}
