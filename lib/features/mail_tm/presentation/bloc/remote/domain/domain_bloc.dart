import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/usecases/get_domain_list.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/usecase/usecase.dart';
import 'domain_event.dart';
import 'domain_state.dart';


class DomainBloc extends Bloc<DomainEvent, DomainState> {
  final GetDomainUseCase domainUsecase;

  DomainBloc({required this.domainUsecase}) : super(DomainInitial());

  @override
  Stream<DomainState> mapEventToState(DomainEvent event) async* {
    if (event is GetDomainsEvent) {
      yield DomainLoading();
      final result = await domainUsecase(NoParams());
      yield result.fold(
            (failure) => DomainError(message: mapFailureToMessage(failure)),
            (domains) => DomainLoaded(domains: domains),
      );
    }
  }
}
