import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'notificatinos_state.dart';

class NotificatinosCubit extends Cubit<NotificatinosState> {
  NotificatinosCubit() : super(NotificatinosInitial());
}
