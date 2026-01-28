CREATE TABLE "stamps" (
    "stamp_id"      bigserial   PRIMARY KEY,
    "stamp_type"    integer     NOT NULL,
    "stamped_at"    timestamp   NOT NULL,
    "created_at"    timestamp,
    "updated_at"    timestamp,
    "deleted_at"    timestamp
);