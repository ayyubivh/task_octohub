import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_octohub/bloc/registration_event.dart';
import 'package:task_octohub/bloc/registration_state.dart';
import 'package:task_octohub/data/api_services.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final ApiService apiService;

  RegistrationBloc(this.apiService) : super(RegistrationInitial()) {
    on<SubmitRegistration>(_onSubmitRegistration);
  }

  Future<void> _onSubmitRegistration(
    SubmitRegistration event,
    Emitter<RegistrationState> emit,
  ) async {
    try {
      emit(RegistrationLoading());
      await apiService.register(event.request);

      emit(RegistrationSuccess());
    } catch (e) {
      emit(RegistrationFailure(e.toString()));
    }
  }
}
