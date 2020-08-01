abstract class ISeriazableResponse<T> {
  T fromJson(Map<String, dynamic> json);
}
