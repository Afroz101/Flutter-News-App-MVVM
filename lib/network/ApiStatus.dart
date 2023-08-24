

class Success {
  int? code;
  Object? response;
  Success({this.code, this.response});
}

class Failure {
  int? code;
  Object? errorResponse;
  Failure({this.code, this.errorResponse});
}

class Loading {
  bool isLoading;
  Loading({required this.isLoading});
}
