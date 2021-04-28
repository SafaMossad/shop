import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/models/user/models_shop_app/search_model.dart';

import 'package:shopapp/modules/shop_app/on_boarding/search/cubit/states.dart';
import 'package:shopapp/shared/components/constants.dart';
import 'package:shopapp/shared/network/remote/dio_helper.dart';
import 'package:shopapp/shared/network/remote/end_point.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel searchModel;

  void search(String text) {
    emit(SearchLoadingState());

    DioHelper.postData(
      url: SEARCH,
      token: token,
      data: {"text": text},
    )
        .then((value) => {
              searchModel = SearchModel.fromJson(value.data),
              emit(SearchSuccessState()),
            })
        .catchError((error) {
      print(error.toString());
      emit(SearchErrorState());
    });
  }
}
