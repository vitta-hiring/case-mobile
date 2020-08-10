import 'package:openmovieapp/features/movies/details/domain/entities/details.dart';

abstract class DetailsDataSource{
 Future<Details> getDetails(String id);
}