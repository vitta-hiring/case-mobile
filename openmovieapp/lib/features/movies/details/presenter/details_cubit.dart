import 'package:async/async.dart';
import 'package:bloc/bloc.dart';
import 'package:openmovieapp/features/movies/details/domain/usecases/get_details_by_Id.dart';
import 'package:openmovieapp/features/movies/details/presenter/states/details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final GetDetailsById getDetailsById;

  CancelableOperation cancelable;

  DetailsCubit(this.getDetailsById) : super(const StartState());

  Future<DetailsState> execute(String id) async {
    final response = await getDetailsById(id);
    final result = response.fold(
      (failure) => ErrorState(failure),
      (success) => SuccessState(success),
    );
    return result;
  }

  Future<void> add(String id) async {
    await cancelable?.cancel();

    if (id.isEmpty) {
      emit(StartState());
      return;
    }
    emit(const LoadingState());
    cancelable = CancelableOperation.fromFuture(
        Future.delayed(Duration(milliseconds: 800)));
    await cancelable.value;
    if (cancelable.isCompleted) {
      emit(await execute(id));
    }
  }
}
