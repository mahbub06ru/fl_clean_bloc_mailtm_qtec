import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_mail_tm_qtec/config/common/space.dart';
import 'package:flutter_clean_mail_tm_qtec/core/constants/assets.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/presentation/bloc/remote/account/account_bloc.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/presentation/pages/account.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/presentation/pages/login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../config/common/components/custom_container.dart';
import '../../../../core/constants/strings.dart';
import '../../domain/entities/domain.dart';
import '../bloc/remote/domain/domain_bloc.dart';
import '../bloc/remote/domain/domain_state.dart';
import '../bloc/remote/login/login_bloc.dart';


class DomainListPage extends StatelessWidget {
   DomainListPage({Key? key}) : super(key: key);

  DateTime? currentBackPressTime;
   Future<bool> onWillPop(BuildContext context) async {
     DateTime now = DateTime.now();
     if (currentBackPressTime == null ||
         now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
       currentBackPressTime = now;

       Fluttertoast.showToast(msg: doubleTap);

       return Future.value(false);
     } else {
       return await showDialog(
         context: context,
         builder: (context) => AlertDialog(
           title: Text('Exit App'),
           content: Text('Are you sure you want to exit?'),
           actions: <Widget>[
             TextButton(
               onPressed: () => Navigator.of(context).pop(false),
               child: Text('No'),
             ),
             TextButton(
               onPressed: () => Navigator.of(context).pop(true),
               child: Text('Yes'),
             ),
           ],
         ),
       );
     }
   }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle,style: TextStyle(color: Colors.white,fontFamily: AppAssets.font,),),
        backgroundColor: Colors.blue,
      ),
      body: WillPopScope(
        onWillPop: () => onWillPop(context),
        child: Column(
          children: [
            const Divider(height: 1,),
            const CustomContainer(text: availableDomain,),
            Space.yf(3),
            Expanded(
              child: Center(
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 12.0,left: 12),
                        child: Text(
                          tap,
                          style: TextStyle(fontSize: 15, color: Colors.black,fontFamily: AppAssets.font),
                        ),
                      ),
                    ),
                    Expanded(
                      child: BlocBuilder<DomainBloc, DomainState>(
                        builder: (context, state) {
                          if (state is DomainLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is DomainLoaded) {
                            return _buildDomainList(context, state.domains);
                          } else if (state is DomainError) {
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDomainList(BuildContext context, List<DomainEntity> domains) {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      itemCount: domains.length,
      itemBuilder: (context, index) {
        final domain = domains[index];
        return Card(
          child: ListTile(
            title: Row(
              children: [
                const Icon(Icons.email,color: Colors.blue,),
                const SizedBox(width: 10,),
                Text(domain.domain, style: const TextStyle(fontSize: 18, color: Colors.blue,fontFamily: AppAssets.font),),
              ],
            ),
            // subtitle: Text('ID: ${domain.id}'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>  AccountScreen(domain.domain),
              ));
            },
          ),
        );
      },
    );
  }
}


