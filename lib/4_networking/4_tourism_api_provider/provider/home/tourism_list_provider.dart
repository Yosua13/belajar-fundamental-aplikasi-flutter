import 'package:flutter/material.dart';
import 'package:training/4_networking/4_tourism_api_provider/data/api/api_service.dart';
import 'package:training/4_networking/4_tourism_api_provider/static/tourism_list_result_state.dart';

class TourismListProvider extends ChangeNotifier {
  final ApiService _apiService;

  TourismListProvider(
    this._apiService,
  );

  TourismListResultState _resultState = TourismListNoneState();

  TourismListResultState get resultState => _resultState;

  Future<void> fetchTourismList() async {
    try {
      _resultState = TourismListLoadingState();
      notifyListeners();

      final result = await _apiService.getTourismList();

      if (result.error) {
        _resultState = TourismListErrorState(result.message);
        notifyListeners();
      } else {
        _resultState = TourismListLoadedState(result.places);
        notifyListeners();
      }
    } on Exception catch (e) {
      _resultState = TourismListErrorState(e.toString());
      notifyListeners();
    }
  }
}
