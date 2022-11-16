import '../../domain/domain.dart';
import '../data.dart';

class SubscriptionRepositoryImpl implements SubscriptionRepository {
  final SubscriptionLocalDataSource localDataSource;

  SubscriptionRepositoryImpl({required this.localDataSource});
}
