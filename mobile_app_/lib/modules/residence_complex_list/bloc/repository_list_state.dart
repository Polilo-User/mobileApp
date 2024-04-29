




part of 'repository_list_bloc.dart';

abstract class RepositoryListState {}

class CryptoListInitial extends RepositoryListState {}

class RepositoryListLoaded extends RepositoryListState {
  RepositoryListLoaded({required this.complexList});
  final List<ResidenceComplex> complexList;
}

class RepositoryListError extends RepositoryListState {}