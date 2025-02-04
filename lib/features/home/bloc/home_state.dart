import 'package:equatable/equatable.dart';
import 'package:hotel_booking/features/home/data/models/hotels_response.dart';

import '../../../core/exception/network_exception.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HotelsDataLoading extends HomeState {}

class HotelsDataSuccess extends HomeState {
  final HotelsResponse hotelsResponse;
  HotelsDataSuccess({
    required this.hotelsResponse,
  });
}

class HotelsDataFailure extends HomeState {
  final NetworkException networkException;

  HotelsDataFailure({
    required this.networkException,
  });

  @override
  List<Object> get props => [networkException];
}
