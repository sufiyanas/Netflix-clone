import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netflix_clone/domain/core/faileres/main_failure.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';
import 'package:netflix_clone/domain/downloads/models/i_downloads_repo.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';

part 'downloads_bloc.freezed.dart';

class DownloadsBloc extends Bloc<DownloadsEvent, DownloadState> {
  final IDownloadsRepo _downloadsRepo;
  DownloadsBloc(this._downloadsRepo) : super(DownloadState.initial()) {
    on<_GetDownloadImage>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          downloddsFailureOrSuccessOption: none(),
        ),
      );

      final Either<MainFailure, List<Downloads>> downloadsOption =
          await _downloadsRepo.getDownloadsImage();
      emit(
        downloadsOption.fold(
          (failure) => state.copyWith(
              isLoading: false,
              downloddsFailureOrSuccessOption: some(left(failure))),
          (success) => state.copyWith(
              isLoading: false,
              downloads: success,
              downloddsFailureOrSuccessOption: some(right(success))),
        ),
      );
    });
  }
}
