import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_mail_tm_qtec/features/mail_tm/domain/usecases/get_domain_list.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../../../../domain/entities/domain.dart';
import 'domain_event.dart';
import 'domain_state.dart';


class DomainBloc extends Bloc<DomainEvent, DomainState> {
  final GetRemoteDomainUseCase _getDomainUseCase;

  DomainBloc(this._getDomainUseCase)
      : super(const DomainLoading(domains: [])) {
    on<GetDomains>(_onLoadDomains);
  }

  void _onLoadDomains(
      GetDomains event, Emitter<DomainState> emit) async {
    try {
      emit(const DomainLoading(domains: []));
      final result = await _getDomainUseCase(NoParams());
      result.fold(
            (failure) => emit(DomainError(
          domains: state.domains,
          failure: failure,
        )),
            (domains) => emit(DomainLoaded(
          domains: domains,
        )),
      );
    } catch (e) {
      log(e.toString());
      emit(DomainError(
        domains: state.domains,
        failure: ExceptionFailure(),
      ));
    }
  }

}

