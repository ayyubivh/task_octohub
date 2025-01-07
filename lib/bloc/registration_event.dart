import 'package:equatable/equatable.dart';

import '../data/registration_model.dart';

abstract class RegistrationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SubmitRegistration extends RegistrationEvent {
  final RegistrationRequest request;

  SubmitRegistration(this.request);

  @override
  List<Object> get props => [request];
}
