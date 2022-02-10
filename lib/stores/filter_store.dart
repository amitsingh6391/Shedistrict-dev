import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mobx/mobx.dart';
import 'package:path/path.dart';

import '../storage.dart';

part 'filter_store.g.dart';
class FilterStore = FilterStoreBase with _$FilterStore;

abstract class FilterStoreBase with Store {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage  _fireStorage = FirebaseStorage.instance;
  Storage storage = Storage();

  @observable
  Map _filteredUsers = {};
  @observable
  Map _currentFilters = {};

  @computed
  Map get filteredUsers => _filteredUsers;
  @computed
  Map get currentFilters => _currentFilters;

  @action
  Future getCurrentFilters(userId) async{
    final response = await _firestore
        .collection('filters')
        .doc(userId)
        .get();

    final d = response.data() as Map;
    return d;
  }

  @action
  Future updateFilters(userId, payload) async{
     await _firestore
        .collection('filters')
        .doc(userId)
        .set(payload);

  }

  @action
  Future getUsers(filters) async{

    final query = await _firestore
        .collection('filters')
        .get();

    var userFilters = query.docs.map((doc) => ({'id' : doc.id, ...doc.data() }));

    if(filters['ageMin'] != null && filters['ageMax'] != null) {
      userFilters = userFilters.where((element) => element['ageMin'] >= filters['ageMin'] && element['ageMax'] >= filters['ageMax']);
    }

    if(filters['distanceMin'] != null && filters['distanceMax'] != null) {
      userFilters = userFilters.where((element) => element['distanceMin'] >= filters['distanceMin'] && element['distanceMax'] >= filters['distanceMax']);
    }


    if(filters['nationality'] != null) {
      userFilters = userFilters.where((element) => element['nationality'] == filters['nationality']);
    }

    final otherFilters = filters['others'];
    otherFilters.forEach((fieldName, value) => {
      if(filters[fieldName] != null) {
        userFilters = userFilters.where((element) => element[fieldName] == value)
      }
    });

    final userIds = userFilters.map((doc) =>  doc['id']).toList();

    final usersQuery = await _firestore
        .collection('users')
        .get();

    var unfilteredUsers = usersQuery.docs.map((doc) => ({ 'id': doc.id, ...doc.data() }));

    unfilteredUsers = unfilteredUsers.where((element) => userIds.contains(element['id'])).toList();
    return unfilteredUsers;
  }

}