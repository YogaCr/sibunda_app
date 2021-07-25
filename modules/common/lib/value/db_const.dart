class DbConst {
  DbConst._();
  static const DB_FILE = "db.sqlite";
  static const NAME_CREDENTIALS = "credentials";
  static const NAME_CITIES = "cities";
  static const NAME_ROLES = "roles";
  static const NAME_PROFILES = "profiles";
  static const NAME_PREGNANCY_CHECK_UP_ID = "pregnancy_check_up_ids";
  static const NAME_BABY_CHECK_UP_ID = "baby_check_up_ids";
  static const REFERENCES = "REFERENCES";

  static const ROLE_ADMIN = 1;
  static const ROLE_USER = 2;

  static const TYPE_MOTHER = 1;
  static const TYPE_FATHER = 2;
  static const TYPE_CHILD = 3;

  static const TYPE_PREGNANCY_CHECK = 1;
  static const TYPE_BABY_CHECK = 2;
}