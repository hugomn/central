CREATE TABLE "portfolio"."transaction" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") );COMMENT ON TABLE "portfolio"."transaction" IS E'Portfolio transactions';
CREATE OR REPLACE FUNCTION "portfolio"."set_current_timestamp_updated_at"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_portfolio_transaction_updated_at"
BEFORE UPDATE ON "portfolio"."transaction"
FOR EACH ROW
EXECUTE PROCEDURE "portfolio"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_portfolio_transaction_updated_at" ON "portfolio"."transaction" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
