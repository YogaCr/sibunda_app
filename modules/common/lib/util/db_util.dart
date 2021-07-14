String getDropTableStatement(String tableName, {
  bool ifExists = true,
}) => "DROP TABLE ${ifExists ? "IF EXISTS " : ""}$tableName";