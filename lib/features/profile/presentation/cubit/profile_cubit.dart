import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<bool> {
  ProfileCubit() : super(false); // false = View Mode

  void toggleEdit() => emit(!state);

  void cancelEdit() => emit(false);

  void enableEdit() => emit(true);
}
