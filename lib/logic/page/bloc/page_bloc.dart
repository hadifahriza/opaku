import 'dart:async';

import 'package:bloc/bloc.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(HomeState());

  @override
  Stream<PageState> mapEventToState(
    PageEvent event,
  ) async* {
    switch (event) {
      case PageEvent.home:
        yield HomeState();
        break;
      case PageEvent.favorite:
        yield FavoriteState();
        break;
      case PageEvent.cart:
        yield CartState();
        break;
      case PageEvent.order:
        yield OrderState();
        break;
      case PageEvent.profile:
        yield ProfileState();
        break;
      default: yield HomeState();
    }
  }
}
