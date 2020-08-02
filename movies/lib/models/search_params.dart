class SearchParams {
  String title;

  SearchParams({
    this.title = '',
  });

  Map<String, String> get toQuery {
    Map<String, String> query = {
      's': title,
    };
    return query;
  }
}
