import 'dart:async';

import 'package:api_bloc/services/coinApi.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CoinService _coinService;

  HomeBloc(this._coinService) : super(HomeLoadingState()) {
    on<LoadApiEvent>((event, emit) async {
      emit(HomeLoadingState());
      var activity = await _coinService.getCoinApi();
      emit(HomeLoadedState(activity.name!, activity.image!, activity.atl!));
    });
  }
}
