import 'package:bloc/bloc.dart';

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
  Stream<SituationCount> mapEventToState(String event) {
    // TODO: implement mapEventToState
    return null;
  }
}
