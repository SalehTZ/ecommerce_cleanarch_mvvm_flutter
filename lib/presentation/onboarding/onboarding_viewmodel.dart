import 'package:shop_app_using_mvvm/presentation/base/base_view_model.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  //todo implement stream controllers

  @override
  void start() {
    // TODO: implement start
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void goNext() {
    // TODO: implement goNext
  }

  @override
  void goPrevious() {
    // TODO: implement goPrevious
  }

  @override
  void onPageChanged(int index) {
    // TODO: implement onPageChanged
  }
}

/// inputs mean orders that the view model
/// will receive from the view
abstract class OnBoardingViewModelInputs {
  /// when user clicks on right arrow or swipe right
  void goNext();

  /// when user clicks on left arrow or swipe left
  void goPrevious();

  /// when the page changes, new index is passed
  void onPageChanged(int index);
}

/// outputs mean data or results that
/// will be received from the view model to the view
abstract class OnBoardingViewModelOutputs {
  //todo implement it later
}
