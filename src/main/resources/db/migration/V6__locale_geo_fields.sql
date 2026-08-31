-- Organization region/city (previously UI-only) and structured branch geography.

ALTER TABLE organizations
    ADD COLUMN IF NOT EXISTS region VARCHAR(128),
    ADD COLUMN IF NOT EXISTS city VARCHAR(128);

ALTER TABLE branches
    ADD COLUMN IF NOT EXISTS country_code VARCHAR(8),
    ADD COLUMN IF NOT EXISTS region VARCHAR(128),
    ADD COLUMN IF NOT EXISTS city VARCHAR(128),
    ADD COLUMN IF NOT EXISTS postal_code VARCHAR(32);

CREATE INDEX IF NOT EXISTS idx_branches_geo
    ON branches (country_code, region, city)
    WHERE deleted_at IS NULL;
