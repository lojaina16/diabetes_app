abstract class HomeState {
  HomeState();
}
class HomeInitial extends HomeState{}


class HomeGetUserDataLoading extends HomeState{}
class HomeGetUserDataError extends HomeState{}
class HomeGetUserDataSuccessfully extends HomeState{}



class HomeSingOutLoading extends HomeState{}
class HomeSingOutError extends HomeState{}
class HomeSingOutSuccessfully extends HomeState{}