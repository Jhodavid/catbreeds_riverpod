import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'package:catbreeds_riverpod/presentation/providers/breeds/utils/breeds_request_status_enum.dart';



final breedsRequestStateProvider = StateNotifierProvider<RequestStateNotifier, BreedsRequestStatesEnum>(
  (ref) => RequestStateNotifier(),
);


class RequestStateNotifier extends StateNotifier<BreedsRequestStatesEnum> {
  
  RequestStateNotifier(): super(BreedsRequestStatesEnum.none);

  void setRequestState(BreedsRequestStatesEnum newState) {
    state = newState;
  }

}