part of 'downloads_bloc.dart';

@immutable
@freezed
class DownloadState with _$DownloadState {
  const factory DownloadState({
    required bool isLoading,
    required List<Downloads> downloads,
    required Option<Either<MainFailure, List<Downloads>>>
        downloddsFailureOrSuccessOption,
  }) = _DownloadState;

  factory DownloadState.initial() {
    return const DownloadState(
        downloddsFailureOrSuccessOption: None(),
        isLoading: false,
        downloads: []);
  }
}
