import 'package:equatable/equatable.dart';

class AllNoticesIntegration extends Equatable{
  final bool success;
  final List<Datum> data;
  const AllNoticesIntegration({required this.success,required this.data});

  @override

  List<Object?> get props => [success,data];
}

class Datum extends Equatable{
  final String id;
  final String title;
  final String category;
  final String message;
  final List<dynamic> document;
  final DateTime createdAt;

  const Datum({ required this.id,
    required this.title,
    required this.category,
    required this.message,
    required this.document,
    required this.createdAt,});



  @override
  List<Object?> get props => [id,title,category,message,document,createdAt];}