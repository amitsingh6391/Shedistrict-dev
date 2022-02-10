// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConversationStore on ConversationStoreBase, Store {
  final _$conversationsAtom = Atom(name: 'ConversationStoreBase.conversations');

  @override
  Map<dynamic, dynamic> get conversations {
    _$conversationsAtom.reportRead();
    return super.conversations;
  }

  @override
  set conversations(Map<dynamic, dynamic> value) {
    _$conversationsAtom.reportWrite(value, super.conversations, () {
      super.conversations = value;
    });
  }

  final _$addPostAsyncAction = AsyncAction('ConversationStoreBase.addPost');

  @override
  Future<void> addPost(dynamic payload) {
    return _$addPostAsyncAction.run(() => super.addPost(payload));
  }

  final _$updatePostAsyncAction =
      AsyncAction('ConversationStoreBase.updatePost');

  @override
  Future<void> updatePost(String postId, dynamic payload) {
    return _$updatePostAsyncAction.run(() => super.updatePost(postId, payload));
  }

  final _$deletePostAsyncAction =
      AsyncAction('ConversationStoreBase.deletePost');

  @override
  Future<void> deletePost(String postId) {
    return _$deletePostAsyncAction.run(() => super.deletePost(postId));
  }

  final _$likeDislikePostAsyncAction =
      AsyncAction('ConversationStoreBase.likeDislikePost');

  @override
  Future<void> likeDislikePost(String postId, dynamic payload) {
    return _$likeDislikePostAsyncAction
        .run(() => super.likeDislikePost(postId, payload));
  }

  @override
  String toString() {
    return '''
conversations: ${conversations}
    ''';
  }
}
