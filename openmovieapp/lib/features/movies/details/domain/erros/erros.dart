abstract class Failure implements Exception{}
class EmptyList extends Failure {}

class ErrorSearch extends Failure {}

class DataSourceError extends Failure{}