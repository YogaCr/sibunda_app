import 'package:common/arch/data/local/db/app_db.dart';
import 'package:common/arch/data/local/entity/account_entity.dart';
import 'package:core/util/_consoles.dart';
import 'package:moor/moor.dart';

part 'account_dao.g.dart';

@UseDao(tables: [CredentialEntities])
class CredentialDao extends DatabaseAccessor<AppDatabase> with _$CredentialDaoMixin {
  CredentialDao(AppDatabase attachedDatabase) : super(attachedDatabase);

  Future<int> insert(Insertable<CredentialEntity> e) => into(credentialEntities).insert(e);
  Future<void> insertAll(List<Insertable<CredentialEntity>> e) => batch((batch) => batch.insertAll(credentialEntities, e));
  Future<int> deleteData(Insertable<CredentialEntity> e) => delete(credentialEntities).delete(e);
  Future<CredentialEntity?> getByEmail(String email) => (select(credentialEntities)..where((it) => it.email.equals(email))).getSingleOrNull();
}

@UseDao(tables: [RoleEntities])
class RoleDao extends DatabaseAccessor<AppDatabase> with _$RoleDaoMixin {
  RoleDao(AppDatabase attachedDatabase) : super(attachedDatabase);

  Future<int> insert(Insertable<RoleEntity> e) => into(roleEntities).insert(e);
  Future<void> insertAll(List<Insertable<RoleEntity>> e) => batch((batch) => batch.insertAll(roleEntities, e));
  Future<int> deleteData(Insertable<RoleEntity> e) => delete(roleEntities).delete(e);
}


@UseDao(tables: [ProfileTypeEntities])
class ProfileTypeDao extends DatabaseAccessor<AppDatabase> with _$ProfileTypeDaoMixin {
  ProfileTypeDao(AppDatabase attachedDatabase) : super(attachedDatabase);

  Future<int> insert(Insertable<ProfileTypeEntity> e) => into(profileTypeEntities).insert(e);
  Future<void> insertAll(List<Insertable<ProfileTypeEntity>> e) => batch((batch) => batch.insertAll(profileTypeEntities, e));
  Future<int> deleteData(Insertable<ProfileTypeEntity> e) => delete(profileTypeEntities).delete(e);
}

@UseDao(tables: [ProfileEntities, CredentialEntities, ProfileTypeEntities])
class ProfileDao extends DatabaseAccessor<AppDatabase> with _$ProfileDaoMixin {
  ProfileDao(AppDatabase attachedDatabase) : super(attachedDatabase);

  Future<int> insert(Insertable<ProfileEntity> e) => into(profileEntities).insert(e);
  Future<void> insertAll(List<Insertable<ProfileEntity>> e) => batch((batch) => batch.insertAll(profileEntities, e));
  Future<int> deleteData(Insertable<ProfileEntity> e) => delete(profileEntities).delete(e);

  Future<ProfileEntity?> getByNik(String nik, { int? type }) async {
    final sel = select(profileEntities)..where((it) => it.nik.equals(nik));
    if(type != null) {
      sel.where((it) => it.type.equals(type));
    }
    return sel.getSingleOrNull();
  }

  /// It returns [Map]<int, String> that maps [ProfileEntities.type] to [ProfileEntities.nik];
  Future<Map<int, String>> getNiksByEmail(String email, { int? type }) async {
    prind("ProfileDao getNiksByEmail() email= $email type= $type");
    final credentials = await (select(credentialEntities)..where((it) => it.email.equals(email))).get();
    prind("ProfileDao getNiksByEmail() credentials = $credentials");
    if(credentials.isEmpty) {
      return Map.unmodifiable({});
    }
    final id = credentials.first.id;
    var sel = select(profileEntities)..where((it) => it.userId.equals(id));
    if(type != null) {
      sel = sel..where((it) => it.type.equals(type));
    }

    final queried = await sel.map((it) => {it.type: it.nik}).get();
    final res = <int, String>{};
    for(final e in queried) {
      res.addAll(e);
    }
    return res;
  }

  /// It returns [Map]<int, String> that maps [ProfileEntities.type] to [ProfileEntities.serverId];
  Future<Map<int, int>> getServerIdByNik(String nik, { int? type }) async {
    final sel = (select(profileEntities)..where((it) => it.nik.equals(nik)));
    if(type != null) {
      sel.where((it) => it.type.equals(type));
    }

    final queried = await sel.map((it) => {it.type: it.serverId}).get();
    final res = <int, int>{};
    for(final e in queried) {
      res.addAll(e);
    }
    return res;
  }
}