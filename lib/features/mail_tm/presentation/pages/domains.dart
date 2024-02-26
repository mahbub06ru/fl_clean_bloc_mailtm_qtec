import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/presentation/pages/account.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/presentation/pages/login.dart';
import '../../../../core/constants/strings.dart';
import '../../domain/entities/domain.dart';
import '../bloc/remote/domain/domain_bloc.dart';
import '../bloc/remote/domain/domain_state.dart';


class DomainListPage extends StatelessWidget {
  const DomainListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle,style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
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
                    'Available Domain',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 12.0,left: 12),
                      child: Text(
                        'Tap to create account or login',
                        style: TextStyle(fontSize: 18, color: Colors.black),
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
                Text(domain.domain, style: const TextStyle(fontSize: 18, color: Colors.blue),),
              ],
            ),
            // subtitle: Text('ID: ${domain.id}'),
            onTap: () {
               Navigator.of(context).push(MaterialPageRoute(
                // builder: (context) => CreateAccountScreen(createAccountUseCase: createAccountUseCase, domainName: domain.domain),
                builder: (context) => const LoginScreen(),
              ));
            },
          ),
        );
      },
    );
  }
}


