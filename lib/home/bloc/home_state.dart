part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadedState extends HomeState {
  final String name;
  final String image;
  final double atl;

  HomeLoadedState(this.name, this.image, this.atl);

  @override
  // TODO: implement props
  List<Object?> get props => [name, image, atl];
}
