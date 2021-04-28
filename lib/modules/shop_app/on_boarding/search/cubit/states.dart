import 'package:shopapp/models/user/models_shop_app/login_model.dart';

abstract class SearchStates {}

class SearchInitialState extends SearchStates {}

class SearchLoadingState extends SearchStates {}

class SearchSuccessState extends SearchStates {}


class SearchErrorState extends SearchStates {}


