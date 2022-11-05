import 'dart:collection';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/faileres/main_failure.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';
import 'package:netflix_clone/domain/downloads/models/i_downloads_repo.dart';
import 'package:netflix_clone/domain/search/models/search_result/search_result.dart';
import 'package:netflix_clone/domain/search/search_service.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsSearvice;
  final SearchSearvice _searchSearvice;
  SearchBloc(this._searchSearvice, this._downloadsSearvice)
      : super(SearchState.initial()) {
    on<Initialize>((event, emit) async {
      emit(const SearchState(
          searchResultList: [], idleList: [], isLoading: true, isError: false));
      final _result = await _downloadsSearvice.getDownloadsImage();
      final state = _result.fold((MainFailure f) {
        return const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true);
      }, (List<Downloads> list) {
        return SearchState(
            searchResultList: [],
            idleList: list,
            isLoading: false,
            isError: false);
      });
      emit(state);

      // TODO: implement event handler
    });
    on<Searchmovie>((event, emit) async {
      log('Searching for ${event.movieQuery}');
      emit(const SearchState(
          searchResultList: [], idleList: [], isLoading: true, isError: false));
      final _result =
          await _searchSearvice.searchMovies(movieQuery: event.movieQuery);

      final _state = _result.fold((MainFailure f) {
        return const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true);
      }, (SearchResult r) {
        return SearchState(
            searchResultList: r.results,
            idleList: [],
            isLoading: false,
            isError: false);
      });
      emit(_state);
      // TODO: implement event handler
    });
  }
}
