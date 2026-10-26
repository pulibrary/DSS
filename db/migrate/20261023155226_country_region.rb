class CountryRegion < ActiveRecord::Migration[8.1]
  def up
    execute <<~END_SQL
    CREATE TABLE countries_regions (
      country_id BIGINT REFERENCES countries(id),
      region_id BIGINT REFERENCES regions(id)
    );

    INSERT INTO regions (name, created_at, updated_at) VALUES
      ('Asia', NOW(), NOW()), ('Europe', NOW(), NOW())
      ON CONFLICT DO NOTHING;

    -- Canada and the US intentionally do NOT have regions, since they have many data sets and users often want
    -- "just Canada" or "just the US".  They are not assigned a region here, so that they are at the top of the
    -- hierarchy and easier for users to find at the top level.
    INSERT INTO countries_regions (country_id, region_id)
      SELECT (c.id, r.id) FROM countries c, regions r WHERE r.name = 'Asia' AND c.name IN ('Singapore', 'South Korea');

    -- Some resources are associated with regions but not countries;
    -- In this case, make the assumption that all 
    -- SELECT DISTINCT (r.id) FROM resources r INNER JOIN regions_resources rr ON rr.resource_id=r.id WHERE r.id NOT IN (SELECT resource_id FROM countries_resources);

    DROP TABLE regions_resources;
    DROP TABLE regions_studies;

    END_SQL
  end

  def down
    execute <<~END_SQL
    DROP TABLE countries_regions;
    CREATE TABLE IF NOT EXISTS regions_resources (
      region_id BIGINT REFERENCES regions(id),
      resource_id INT REFERENCES resources(id)
    );
    CREATE TABLE IF NOT EXISTS  regions_studies (
      region_id BIGINT REFERENCES regions(id),
      resource_id BIGINT REFERENCES studies(id)
    );
    END_SQL
  end
end
