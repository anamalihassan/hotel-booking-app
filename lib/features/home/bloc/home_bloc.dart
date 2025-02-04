import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/features/home/bloc/home_event.dart';
import 'package:hotel_booking/features/home/bloc/home_state.dart';
import 'package:hotel_booking/features/home/data/repository/home_repository.dart';

import '../../../core/exception/network_exception.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository;

  HomeBloc({required HomeRepository repository})
      : _homeRepository = repository,
        super(HomeInitial()) {
    on<FetchHotelsDataEvent>(mapFetchHotelsDataEventToState);
  }

  Future<void> mapFetchHotelsDataEventToState(
    FetchHotelsDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HotelsDataLoading());
    try {
      final response = await _homeRepository.fetchHotelsData();
      emit(HotelsDataSuccess(hotelsResponse: response));
    } on NetworkException catch (e) {
      emit(HotelsDataFailure(networkException: e));
    } catch (err) {
      emit(HotelsDataFailure(networkException: NetworkException()));
    }
  }
}
