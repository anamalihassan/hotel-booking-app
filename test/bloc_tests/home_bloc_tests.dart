import 'package:bloc_test/bloc_test.dart';
import 'package:hotel_booking/core/exception/network_exception.dart';
import 'package:hotel_booking/features/favourites/data/repository/favourites_repository.dart';
import 'package:hotel_booking/features/home/bloc/home_bloc.dart';
import 'package:hotel_booking/features/home/bloc/home_event.dart';
import 'package:hotel_booking/features/home/bloc/home_state.dart';
import 'package:hotel_booking/features/home/data/repository/home_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../mocks/mock_hotels_response.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

class MockFavouritesRepository extends Mock implements FavouritesRepository {}

void main() {
  group('Home Bloc Tests', () {
    late MockHomeRepository mockHomeRepository;
    late NetworkException networkException;
    setUp(() {
      mockHomeRepository = MockHomeRepository();
      networkException = NetworkException();
    });
    blocTest<HomeBloc, HomeState>(
      'Fetch Hotels Data Test When Success',
      setUp: () => when(mockHomeRepository.fetchHotelsData).thenAnswer((_) async => hotelsResponse),
      build: () => HomeBloc(repository: mockHomeRepository),
      act: (bloc) => bloc.add(FetchHotelsDataEvent()),
      expect: () => [HotelsDataLoading(), HotelsDataSuccess(hotelsResponse: hotelsResponse)],
      verify: (_) => verify(mockHomeRepository.fetchHotelsData).called(1),
    );
    blocTest<HomeBloc, HomeState>(
      'Fetch Hotels Data Test When Failure',
      setUp: () => when(mockHomeRepository.fetchHotelsData).thenThrow(networkException),
      build: () => HomeBloc(repository: mockHomeRepository),
      act: (bloc) => bloc.add(FetchHotelsDataEvent()),
      expect: () => [HotelsDataLoading(), HotelsDataFailure(networkException: networkException)],
      verify: (_) => verify(mockHomeRepository.fetchHotelsData).called(1),
    );
  });
}
