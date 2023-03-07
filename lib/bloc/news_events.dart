part of 'news_bloc.dart';

abstract class NewsEvents extends Equatable {
  const NewsEvents();
}

class FetchNewsEvent extends NewsEvents {
  int pageNumber;

  FetchNewsEvent(this.pageNumber);
  @override
  List<Object> get props => [pageNumber];
}
