import 'package:bloc/bloc.dart';
import 'package:data/data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';

part 'github_trending_event.dart';

part 'github_trending_state.dart';

part 'github_trending_bloc.freezed.dart';

class GithubTrendingBloc
    extends Bloc<GithubTrendingEvent, GithubTrendingState> {

  final GithubTrendingRepository _repo;
  Stream<List<GithubRepo>> get dataStream async* {
    yield* _repo.githubTrendingData;
  }

  GithubTrendingBloc(this._repo) : super(const GithubTrendingState.initial()) {
    on<GithubTrendingEvent>((event, emit) {
      switch (event) {
        case _GithubTrendingStarted():
          _getDataFromRepo();
        case _GithubTrendingSortByStarsClicked():
          _repo.sortByStars();
        case _GithubTrendingSortByNameClicked():
          _repo.sortByName();
        case _GithubTrendingItemClicked(data: var data):
          _toggleItemExpanded(data);
        case _GithubTrendingRefreshed():
          _getDataFromRepo();
      }
    });

    add(const GithubTrendingEvent.githubTrendingStarted());
  }

  void _toggleItemExpanded(GithubRepo data){
    _repo.toggleExpanded(data.id);
  }

  void _getDataFromRepo() async {

    if(state is GithubTrendingStateLoading){
      return;
    }

    emit(GithubTrendingState.loading());

    Resource<List<GithubRepo>> githubTrendingData =
        await _repo.getGithubTrendingData();
    switch (githubTrendingData) {
      case ResourceSuccess<List<GithubRepo>>(data: final data):
        {
          emit(GithubTrendingState.success(data));
        }
      case ResourceError<List<GithubRepo>>(
          message: final message,
          exception: final exception
        ):
        {
          emit(GithubTrendingState.error(message, exception));
        }
    }
  }
}
