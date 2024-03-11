import 'package:bloc/bloc.dart';
import 'package:data/data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';

part 'github_trending_event.dart';

part 'github_trending_state.dart';

part 'github_trending_bloc.freezed.dart';

class GithubTrendingBloc
    extends Bloc<GithubTrendingEvent, GithubTrendingState> {
  final GithubTrendingRepository repo;

  GithubTrendingBloc({required this.repo})
      : super(const GithubTrendingState.initial()) {
    on<GithubTrendingEvent>((event, emit) {
      switch (event) {
        case _GithubTrendingStarted():
          {}
        case _GithubTrendingSortByStarsClicked():
          {}
        case _GithubTrendingSortByNameClicked():
          {}
        case _GithubTrendingItemClicked():
          {}
      }
    });
  }
}
