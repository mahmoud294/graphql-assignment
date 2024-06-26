import 'package:github_graphql/domain/repositories/graph_repository.dart';
import 'package:github_graphql/data/data_sources/graph_data_source.dart';



/// GraphRepositoryImpl is the concrete implementation of the GraphRepository
/// interface.
/// This class implements the methods defined in GraphRepository to interact
/// with data. It acts as a bridge between the domain layer
/// (use cases) and the data layer (data sources).
class GraphRepositoryImpl implements GraphRepository {
      
   final GraphDataSource  graphDataSource;
   GraphRepositoryImpl(this.graphDataSource);
}