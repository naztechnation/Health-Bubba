

 
import '../../res/enum.dart';
import 'base_viewmodel.dart';

class UserViewModel extends BaseViewModel {
 
  int _currentIndex = 0;


    updateIndex(int index) async {
    _currentIndex = index;

    setViewState(ViewState.success);
  }


  int get currentPage => _currentIndex;

}
