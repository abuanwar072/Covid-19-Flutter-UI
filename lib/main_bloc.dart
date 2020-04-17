import 'package:bloc/bloc.dart';
import 'package:covid_19/utils/api.dart';

import 'model/statistic_model.dart';

class SituationCount {
  SituationCount({this.infected, this.death, this.recover});

  int infected;
  int death;
  int recover;
}

class CounterBloc extends Bloc<String, SituationCount> {
  @override
  // TODO: implement initialState
  SituationCount get initialState =>
      SituationCount(death: 0, infected: 0, recover: 0);

  @override
  Stream<SituationCount> mapEventToState(String event) async* {
    Statistic stat;
    try {
      stat = await HomeApi().getStatistic(event);
    } catch (e, stack) {
      print(e);
      print(stack);
    }

    yield SituationCount(
        infected: stat.response.first.cases.total,
        death: stat.response.first.deaths.total,
        recover: stat.response.first.cases.recovered);
  }
}

class CountriesBloc extends Bloc<bool, List<String>> {
  @override
  // TODO: implement initialState
  List<String> get initialState => [];

  @override
  Stream<List<String>> mapEventToState(bool event) async* {
    // TODO: implement mapEventToState
    Countries countries;
    try {
      countries = await HomeApi().getCountries();
    } catch (e, stack) {
      print(e);
      print(stack);
    }

    yield countries.response;
  }
}
