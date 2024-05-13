



part of 'repository_list_bloc.dart';



abstract class RepositoryListEvent {}

class LoadRepositoryList extends RepositoryListEvent {}

class LoadRepositoryListWithComplex extends RepositoryListEvent {
  final int buildId;
  LoadRepositoryListWithComplex(this.buildId);
}