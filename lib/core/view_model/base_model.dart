import 'package:ecommers_ui/core/enum/viewstate.dart';
import 'package:flutter/cupertino.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.idle;
  // APIRepository _apiRepository = new APIRepository();

  ViewState get state => _state;

  // APIRepository get apiRepository => _apiRepository;
  //
  // set apiRepository(APIRepository value) {
  //   _apiRepository = value;
  // }

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  updateUI() {
    notifyListeners();
  }
}
