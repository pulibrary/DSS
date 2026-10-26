class CountryRegion < ActiveRecord::Migration[8.1]
  def up
    add_index :countries, [:name], unique: true
    add_index :regions, [:name], unique: true

    execute <<~END_SQL
    CREATE TABLE countries_regions (
      country_id BIGINT REFERENCES countries(id),
      region_id BIGINT REFERENCES regions(id)
    );

    INSERT INTO countries (name, created_at, updated_at) VALUES
      ('Angola', NOW(), NOW()),
      ('Benin', NOW(), NOW()),
      ('Botswana', NOW(), NOW()),
      ('Burkina Faso', NOW(), NOW()),
      ('Burundi', NOW(), NOW()),
      ('Cabo Verde', NOW(), NOW()),
      ('Cameroon', NOW(), NOW()),
      ('Central African Republic', NOW(), NOW()),
      ('Chad', NOW(), NOW()),
      ('Comoros', NOW(), NOW()),
      ('Congo, Republic of', NOW(), NOW()),
      ('Cote d''Ivorie', NOW(), NOW()),
      ('Democratic Republic of the Congo (formerly Zaire)', NOW(), NOW()),
      ('Equatorial Guinea', NOW(), NOW()),
      ('Eritrea', NOW(), NOW()),
      ('Ethiopia', NOW(), NOW()),
      ('Gabon', NOW(), NOW()),
      ('Gambia', NOW(), NOW()),
      ('Ghana', NOW(), NOW()),
      ('Guinea', NOW(), NOW()),
      ('Guinea-Bissau', NOW(), NOW()),
      ('Kenya', NOW(), NOW()),
      ('Lesotho', NOW(), NOW()),
      ('Liberia', NOW(), NOW()),
      ('Madagascar', NOW(), NOW()),
      ('Malawi', NOW(), NOW()),
      ('Mali', NOW(), NOW()),
      ('Mauritius', NOW(), NOW()),
      ('Mozambique', NOW(), NOW()),
      ('Namibia', NOW(), NOW()),
      ('Niger', NOW(), NOW()),
      ('Nigeria', NOW(), NOW()),
      ('Rwanda', NOW(), NOW()),
      ('Sao Tome and Principe', NOW(), NOW()),
      ('Senegal', NOW(), NOW()),
      ('Seychelles', NOW(), NOW()),
      ('Sierra Leone', NOW(), NOW()),
      ('South Africa', NOW(), NOW()),
      ('South Sudan', NOW(), NOW()),
      ('Sudan', NOW(), NOW()),
      ('Swaziland', NOW(), NOW()),
      ('Tanzania', NOW(), NOW()),
      ('Togo', NOW(), NOW()),
      ('Uganda', NOW(), NOW()),
      ('Zambia', NOW(), NOW()),
      ('Zimbabwe', NOW(), NOW()),
      ('Bangladesh', NOW(), NOW()),
      ('Bhutan', NOW(), NOW()),
      ('Cambodia', NOW(), NOW()),
      ('China', NOW(), NOW()),
      ('Cyprus', NOW(), NOW()),
      ('Georgia', NOW(), NOW()),
      ('India', NOW(), NOW()),
      ('Indonesia', NOW(), NOW()),
      ('Japan', NOW(), NOW()),
      ('Kazakhstan', NOW(), NOW()),
      ('Kyrgyzstan', NOW(), NOW()),
      ('Laos', NOW(), NOW()),
      ('Malaysia', NOW(), NOW()),
      ('Maldives', NOW(), NOW()),
      ('Mongolia', NOW(), NOW()),
      ('Myanmar', NOW(), NOW()),
      ('Nepal', NOW(), NOW()),
      ('North Korea', NOW(), NOW()),
      ('Pakistan', NOW(), NOW()),
      ('Philippines', NOW(), NOW()),
      ('Singapore', NOW(), NOW()),
      ('South Korea', NOW(), NOW()),
      ('Sri Lanka', NOW(), NOW()),
      ('Tajikistan', NOW(), NOW()),
      ('Thailand', NOW(), NOW()),
      ('Timor-Leste', NOW(), NOW()),
      ('Turkmenistan', NOW(), NOW()),
      ('Uzbekistan', NOW(), NOW()),
      ('Vietnam', NOW(), NOW()),
      ('Canada', NOW(), NOW()),
      ('Albania', NOW(), NOW()),
      ('Andorra', NOW(), NOW()),
      ('Austria', NOW(), NOW()),
      ('Belarus', NOW(), NOW()),
      ('Belgium', NOW(), NOW()),
      ('Bosnia & Herzegovina', NOW(), NOW()),
      ('Bulgaria', NOW(), NOW()),
      ('Croatia', NOW(), NOW()),
      ('Czechia', NOW(), NOW()),
      ('Denmark', NOW(), NOW()),
      ('Estonia', NOW(), NOW()),
      ('Finland', NOW(), NOW()),
      ('France', NOW(), NOW()),
      ('Germany', NOW(), NOW()),
      ('Greece', NOW(), NOW()),
      ('Hungary', NOW(), NOW()),
      ('Iceland', NOW(), NOW()),
      ('Ireland', NOW(), NOW()),
      ('Italy', NOW(), NOW()),
      ('Latvia', NOW(), NOW()),
      ('Liechtenstein', NOW(), NOW()),
      ('Lithuania', NOW(), NOW()),
      ('Luxembourg', NOW(), NOW()),
      ('Malta', NOW(), NOW()),
      ('Moldova', NOW(), NOW()),
      ('Monaco', NOW(), NOW()),
      ('Montenegro', NOW(), NOW()),
      ('Netherlands', NOW(), NOW()),
      ('North Macedonia', NOW(), NOW()),
      ('Norway', NOW(), NOW()),
      ('Poland', NOW(), NOW()),
      ('Portugal', NOW(), NOW()),
      ('Romania', NOW(), NOW()),
      ('Russia', NOW(), NOW()),
      ('San Marino', NOW(), NOW()),
      ('Serbia', NOW(), NOW()),
      ('Slovakia', NOW(), NOW()),
      ('Slovenia', NOW(), NOW()),
      ('Spain', NOW(), NOW()),
      ('Sweden', NOW(), NOW()),
      ('Switzerland', NOW(), NOW()),
      ('Ukraine', NOW(), NOW()),
      ('United Kingdom', NOW(), NOW()),
      ('Antigua and Barbuda', NOW(), NOW()),
      ('Argentina', NOW(), NOW()),
      ('Bahamas', NOW(), NOW()),
      ('Barbados', NOW(), NOW()),
      ('Belize', NOW(), NOW()),
      ('Bolivia', NOW(), NOW()),
      ('Brazil', NOW(), NOW()),
      ('Chile', NOW(), NOW()),
      ('Colombia', NOW(), NOW()),
      ('Costa Rica', NOW(), NOW()),
      ('Cuba', NOW(), NOW()),
      ('Dominica', NOW(), NOW()),
      ('Dominican Republic', NOW(), NOW()),
      ('Ecuador', NOW(), NOW()),
      ('El Salvador', NOW(), NOW()),
      ('Grenada', NOW(), NOW()),
      ('Guatemala', NOW(), NOW()),
      ('Guyana', NOW(), NOW()),
      ('Haiti', NOW(), NOW()),
      ('Honduras', NOW(), NOW()),
      ('Jamaica', NOW(), NOW()),
      ('Mexico', NOW(), NOW()),
      ('Nicaragua', NOW(), NOW()),
      ('Panama', NOW(), NOW()),
      ('Paraguay', NOW(), NOW()),
      ('Peru', NOW(), NOW()),
      ('Saint Kitts and Nevis', NOW(), NOW()),
      ('Saint Lucia', NOW(), NOW()),
      ('Saint Vincent and the Grenadines', NOW(), NOW()),
      ('Suriname', NOW(), NOW()),
      ('Trinidad and Tobago', NOW(), NOW()),
      ('Uruguay', NOW(), NOW()),
      ('Venezuela', NOW(), NOW()),
      ('Afghanistan', NOW(), NOW()),
      ('Algeria', NOW(), NOW()),
      ('Armenia', NOW(), NOW()),
      ('Azerbaijan', NOW(), NOW()),
      ('Bahrain', NOW(), NOW()),
      ('Brunei Darussalam', NOW(), NOW()),
      ('Djibouti', NOW(), NOW()),
      ('Egypt', NOW(), NOW()),
      ('Iran', NOW(), NOW()),
      ('Iraq', NOW(), NOW()),
      ('Israel', NOW(), NOW()),
      ('Jordan', NOW(), NOW()),
      ('Kuwait', NOW(), NOW()),
      ('Lebanon', NOW(), NOW()),
      ('Libya', NOW(), NOW()),
      ('Mauritania', NOW(), NOW()),
      ('Morocco', NOW(), NOW()),
      ('Oman', NOW(), NOW()),
      ('Palestine', NOW(), NOW()),
      ('Qatar', NOW(), NOW()),
      ('Saudi Arabia', NOW(), NOW()),
      ('Somalia', NOW(), NOW()),
      ('Syria', NOW(), NOW()),
      ('Tunisia', NOW(), NOW()),
      ('Turkey', NOW(), NOW()),
      ('United Arab Emirates', NOW(), NOW()),
      ('Yemen', NOW(), NOW()),
      ('Australia', NOW(), NOW()),
      ('Cook Islands', NOW(), NOW()),
      ('Fiji', NOW(), NOW()),
      ('Kiribati', NOW(), NOW()),
      ('Marshall Islands', NOW(), NOW()),
      ('Micronesia, Federated States', NOW(), NOW()),
      ('Nauru', NOW(), NOW()),
      ('New Zealand', NOW(), NOW()),
      ('Niue', NOW(), NOW()),
      ('Palau', NOW(), NOW()),
      ('Papua New Guinea', NOW(), NOW()),
      ('Samoa', NOW(), NOW()),
      ('Solomon Islands', NOW(), NOW()),
      ('Tonga', NOW(), NOW()),
      ('Tuvalu', NOW(), NOW()),
      ('Vanuatu', NOW(), NOW()),
      ('United States', NOW(), NOW())
      ON CONFLICT DO NOTHING;

    INSERT INTO regions (name, created_at, updated_at) VALUES
      ('Africa', NOW(), NOW()), ('Asia', NOW(), NOW()), ('Europe', NOW(), NOW()), ('Latin America & the Caribbean', NOW(), NOW()),
      ('Middle East/North Africa', NOW(), NOW()), ('Oceania', NOW(), NOW())
      ON CONFLICT DO NOTHING;

    -- Canada and the US intentionally do NOT have regions, since they have many data sets and users often want
    -- "just Canada" or "just the US".  They are not assigned a region here, so that they are at the top of the
    -- hierarchy and easier for users to find at the top level.
    INSERT INTO countries_regions (country_id, region_id)
    SELECT c.id, r.id FROM countries c, regions r WHERE r.name = 'Africa' AND c.name IN ('Angola', 'Benin', 'Botswana', 'Burkina Faso', 'Burundi', 'Cabo Verde', 'Cameroon', 'Central African Republic', 'Chad', 'Comoros', 'Congo, Republic of', 'Cote d''Ivorie', 'Democratic Republic of the Congo (formerly Zaire)', 'Equatorial Guinea', 'Eritrea', 'Ethiopia', 'Gabon', 'Gambia', 'Ghana', 'Guinea', 'Guinea-Bissau', 'Kenya', 'Lesotho', 'Liberia', 'Madagascar', 'Malawi', 'Mali', 'Mauritius', 'Mozambique', 'Namibia', 'Niger', 'Nigeria', 'Rwanda', 'Sao Tome and Principe', 'Senegal', 'Seychelles', 'Sierra Leone', 'South Africa', 'South Sudan', 'Sudan', 'Swaziland', 'Tanzania', 'Togo', 'Uganda', 'Zambia', 'Zimbabwe');
    INSERT INTO countries_regions (country_id, region_id)
    SELECT c.id, r.id FROM countries c, regions r WHERE r.name = 'Asia' AND c.name IN ('Bangladesh', 'Bhutan', 'Cambodia', 'China', 'Cyprus', 'Georgia', 'India', 'Indonesia', 'Japan', 'Kazakhstan', 'Kyrgyzstan', 'Laos', 'Malaysia', 'Maldives', 'Mongolia', 'Myanmar', 'Nepal', 'North Korea', 'Pakistan', 'Philippines', 'Singapore', 'South Korea', 'Sri Lanka', 'Tajikistan', 'Thailand', 'Timor-Leste', 'Turkmenistan', 'Uzbekistan', 'Vietnam');
    INSERT INTO countries_regions (country_id, region_id)
    SELECT c.id, r.id FROM countries c, regions r WHERE r.name = 'Europe' AND c.name IN ('Albania', 'Andorra', 'Austria', 'Belarus', 'Belgium', 'Bosnia & Herzegovina', 'Bulgaria', 'Croatia', 'Czechia', 'Denmark', 'Estonia', 'Finland', 'France', 'Germany', 'Greece', 'Hungary', 'Iceland', 'Ireland', 'Italy', 'Latvia', 'Liechtenstein', 'Lithuania', 'Luxembourg', 'Malta', 'Moldova', 'Monaco', 'Montenegro', 'Netherlands', 'North Macedonia', 'Norway', 'Poland', 'Portugal', 'Romania', 'Russia', 'San Marino', 'Serbia', 'Slovakia', 'Slovenia', 'Spain', 'Sweden', 'Switzerland', 'Ukraine', 'United Kingdom');
    INSERT INTO countries_regions (country_id, region_id)
    SELECT c.id, r.id FROM countries c, regions r WHERE r.name = 'Latin America & the Caribbean' AND c.name IN ('Antigua and Barbuda', 'Argentina', 'Bahamas', 'Barbados', 'Belize', 'Bolivia', 'Brazil', 'Chile', 'Colombia', 'Costa Rica', 'Cuba', 'Dominica', 'Dominican Republic', 'Ecuador', 'El Salvador', 'Grenada', 'Guatemala', 'Guyana', 'Haiti', 'Honduras', 'Jamaica', 'Mexico', 'Nicaragua', 'Panama', 'Paraguay', 'Peru', 'Saint Kitts and Nevis', 'Saint Lucia', 'Saint Vincent and the Grenadines', 'Suriname', 'Trinidad and Tobago', 'Uruguay', 'Venezuela');
    INSERT INTO countries_regions (country_id, region_id)
    SELECT c.id, r.id FROM countries c, regions r WHERE r.name = 'Middle East/North Africa' AND c.name IN ('Afghanistan', 'Algeria', 'Armenia', 'Azerbaijan', 'Bahrain', 'Brunei Darussalam', 'Djibouti', 'Egypt', 'Iran', 'Iraq', 'Israel', 'Jordan', 'Kuwait', 'Lebanon', 'Libya', 'Mauritania', 'Morocco', 'Oman', 'Palestine', 'Qatar', 'Saudi Arabia', 'Somalia', 'Syria', 'Tunisia', 'Turkey', 'United Arab Emirates', 'Yemen');
    INSERT INTO countries_regions (country_id, region_id)
    SELECT c.id, r.id FROM countries c, regions r WHERE r.name = 'Oceania' AND c.name IN ('Australia', 'Cook Islands', 'Fiji', 'Kiribati', 'Marshall Islands', 'Micronesia, Federated States', 'Nauru', 'New Zealand', 'Niue', 'Palau', 'Papua New Guinea', 'Samoa', 'Solomon Islands', 'Tonga', 'Tuvalu', 'Vanuatu');

    -- Some resources are associated with regions but not countries;
    -- In this case, make the assumption that all 
    -- SELECT DISTINCT (r.id) FROM resources r INNER JOIN regions_resources rr ON rr.resource_id=r.id WHERE r.id NOT IN (SELECT resource_id FROM countries_resources);

    DROP TABLE regions_resources;
    DROP TABLE regions_studies;

    END_SQL
  end

  def down
    drop_index :countries, [:name], unique: true
    drop_index :regions, [:name], unique: true
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
