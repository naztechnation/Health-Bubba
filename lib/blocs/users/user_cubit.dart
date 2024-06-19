import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/view_model/user_view_model.dart';
import '../../requests/repositories/user_repo/user_repository.dart';
import '../../utils/exceptions.dart';
import 'user_states.dart';

class UserCubit extends Cubit<UserStates> {
UserCubit({required this.userRepository, required this.viewModel})
      : super(const InitialState());
  final UserRepository userRepository;
  final UserViewModel viewModel;

   Future<void> getPatientsLists({required String page,required String limit,}) async {
    try {
      emit(PatientsListLoading());

      final user = await userRepository.getPatientsLists(page: page, limit: limit     );

      emit(PatientsListLoaded(user));
    } on ApiException catch (e) {
      emit(UserApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(UserNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }
}