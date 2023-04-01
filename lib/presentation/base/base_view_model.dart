abstract class BaseViewModel extends BaseViewModelInputes
    with BaseViewModelOutputes {
  //! Shared variables and functions that
  //! will be used through any view model
}

abstract class BaseViewModelInputes {
  // will be called when view model is initialized
  void start();

  // will be called when view model is disposed
  void dispose();
}

abstract class BaseViewModelOutputes {}
