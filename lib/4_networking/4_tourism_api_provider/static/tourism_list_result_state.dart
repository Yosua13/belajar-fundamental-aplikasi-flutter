import 'package:training/4_networking/4_tourism_api_provider/data/model/tourism.dart';

sealed class TourismListResultState {}

class TourismListNoneState extends TourismListResultState {}

class TourismListLoadingState extends TourismListResultState {}

class TourismListErrorState extends TourismListResultState {
  final String error;

  TourismListErrorState(this.error);
}

class TourismListLoadedState extends TourismListResultState {
  final List<Tourism> data;

  TourismListLoadedState(this.data);
}
