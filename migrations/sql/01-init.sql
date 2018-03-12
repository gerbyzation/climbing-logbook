CREATE TABLE users (
  id INT PRIMARY KEY AUTOINCREMENT,
  name STRING NOT NULL,
  email: STRING NOT NULL UNIQUE
);

CREATE TABLE grades (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name STRING NOT NULL,
  value INT NOT NULL
);

CREATE TABLE route_types (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name STRING NOT NULL
);

CREATE TABLE routes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name STRING NOT NULL,
  grade_id UUID NOT NULL REFERENCES grades,
  type_id UUID NOT NULL REFERENCES route_types,
  INDEX (grade_id),
  INDEX (type_id)
);

CREATE TABLE ascent_styles (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name STRING NOT NULL
);

CREATE TABLE entries (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  climber UUID NOT NULL REFERENCES users,
  date DATE,
  style UUID REFERENCES ascent_styles,
  route UUID NOT NULL REFERENCES routes,
  INDEX (climber),
  INDEX (style),
  INDEX (route)
);

CREATE TABLE entry_partners (
  id UUID PRIMARY_KEY DEFAULT gen_random_uuid(),
  entry UUID NOT NULL REFERENCES entries,
  partner UUID NOT NULL REFERENCES users,
  INDEX (entry),
  INDEX (partner)
);
