import 'package:bloc/bloc.dart';
import 'package:hnbdemo/domain/usecases/get_movies_usecase.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetMovies getMovies;

  HomeCubit(this.getMovies) : super(HomeState(movies: [])) {
    this.getMovies.get().then((movies) => emit(HomeState(movies: movies)));
  }
}
