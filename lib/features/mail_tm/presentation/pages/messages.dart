import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_mail_tm_qtec/config/common/configs.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/presentation/bloc/remote/account/account_bloc.dart';

import '../../../../config/common/components/custom_container.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/constants/strings.dart';
import '../../domain/entities/message.dart';
import '../bloc/remote/message/message_bloc.dart';
import '../bloc/remote/message/message_state.dart';

class MessageListPage extends StatelessWidget {
  final String mail;
  final String domain;
  MessageListPage(this.mail,this.domain, {super.key});

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
          CustomContainer(text:'$mail@$domain'),
          /*BlocBuilder<MessageBloc, MessageState>(
            builder: (context, state) {
              print("Current State: $state");
              if (state is MessageLoaded && state.messages.isNotEmpty) {
                final address = state.messages.first.toAddress;
                return CustomContainer(text: address,);
              } else {
                return  const CustomContainer(text: '');
              }
            },
          ),*/
          Space.yf(3),
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
                  return const Center(
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
    return Padding(
      padding: Space.all(1, 1),
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];
          return Card(
            child: ListTile(
              title: Text(message.subject,style: const TextStyle(color: Colors.blue,fontFamily: AppAssets.font)),
              // subtitle: Text('Body: ${message.intro}',style: const TextStyle(fontSize: 16, color: Colors.black,fontFamily: AppAssets.font)),
              subtitle: ExpandableText(
                message.intro,
                expandText: 'show more',
                collapseText: 'show less',
                maxLines: 3,
                linkColor: Colors.blue,
              ),
              onTap: () {
                // Handle tap on the message
              },
            ),
          );
        },
      ),
    );
  }
}
