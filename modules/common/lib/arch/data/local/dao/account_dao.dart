import 'package:common/arch/data/local/db/app_db.dart';
import 'package:common/arch/data/local/entity/account_entity.dart';
import 'package:moor/moor.dart';

part 'account_dao.g.dart';

@UseDao(tables: [CredentialEntities])
class CredentialDao extends DatabaseAccessor<AppDatabase> with _$CredentialDaoMixin {
  CredentialDao(AppDatabase attachedDatabase) : super(attachedDatabase);

  Future<int> insert(Insertable<CredentialEntity> e) => into(credentialEntities).insert(e);
  Future<int> deleteData(Insertable<CredentialEntity> e) => delete(credentialEntities).delete(e);
}

@UseDao(tables: [RoleEntities])
class RoleDao extends DatabaseAccessor<AppDatabase> with _$RoleDaoMixin {
  RoleDao(AppDatabase attachedDatabase) : super(attachedDatabase);

  Future<int> insert(Insertable<RoleEntity> e) => into(roleEntities).insert(e);
  Future<int> deleteData(Insertable<RoleEntity> e) => delete(roleEntities).delete(e);
}

@UseDao(tables: [ProfileEntities, CredentialEntities])
class ProfileDao extends DatabaseAccessor<AppDatabase> with _$ProfileDaoMixin {
  ProfileDao(AppDatabase attachedDatabase) : super(attachedDatabase);

  Future<int> insert(Insertable<ProfileEntity> e) => into(profileEntities).insert(e);
  Future<int> deleteData(Insertable<ProfileEntity> e) => delete(profileEntities).delete(e);
  Future<String?> getNikByEmail(String email, { int? role }) async {
    final credentials = await (select(credentialEntities)..where((it) => it.email.equals(email))).get();
    if(credentials.isEmpty) {
      return null;
    }
    final id = credentials.first.id;
    var sel = select(profileEntities)..where((it) => it.id.equals(id));
    if(role != null) {
      sel = sel..where((it) => it.role.equals(role));
    }
    return await sel.map((it) => it.nik).getSingleOrNull();
  }
}