import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/domain.dart';
import '../bloc/remote/domain/domain_bloc.dart';
import '../bloc/remote/domain/domain_state.dart';


class DomainListPage extends StatelessWidget {
  const DomainListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Domain List'),
      ),
      body: BlocBuilder<DomainBloc, DomainState>(
        builder: (context, state) {
          if (state is DomainLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DomainLoaded) {
            return _buildDomainList(context, state.domains);
          } else if (state is DomainError) {
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

  Widget _buildDomainList(BuildContext context, List<DomainEntity> domains) {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      itemCount: domains.length,
      itemBuilder: (context, index) {
        final domain = domains[index];
        return ListTile(
          title: Text(domain.domain),
          subtitle: Text('ID: ${domain.id}'),
          onTap: () {
            /* Navigator.of(context).push(MaterialPageRoute(
              // builder: (context) => CreateAccountScreen(createAccountUseCase: createAccountUseCase, domainName: domain.domain),
              builder: (context) => CreateEmailPage(),
            ));*/
          },
        );
      },
    );
  }
}


