import 'package:dependencies/dependencies.dart';

part 'time_dto_hive.g.dart';

@HiveType(typeId: 7)
class ReportDTO extends Equatable {
  ReportDTO({required this.date, this.time});
  @HiveField(0)
  late DateTime date;

  @HiveField(1)
  late int? time;

  @override
  List<Object?> get props => [
        date,
        time,
      ];
}
