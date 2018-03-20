/* INSERT INTO grades (name, value) */
/* VALUES */
/*   ('Diff', 0), */
/*   ('VDiff', 1), */
/*   ('HVD', 2), */
/*   ('S', 3), */
/*   ('HS', 4), */
/*   ('VS', 5), */
/*   ('HVS', 6), */
/*   ('E1', 7), */
/*   ('E2', 8), */
/*   ('E3', 9), */
/*   ('E4', 10), */
/*   ('E5', 11), */
/*   ('E6', 12), */
/*   ('E7', 13), */
/*   ('E8', 14), */
/*   ('E9', 15), */
/*   ('E10', 16); */

/* INSERT INTO route_types (name) */
/* VALUES */
/*   ('Trad'), */
/*   ('Sport'), */
/*   ('DWS'), */
/*   ('Ice'), */
/*   ('Alpine'), */
/*   ('Bouldering'), */
/*   ('Scrambling'); */

/* INSERT INTO ascent_styles (name) */
/* VALUES */
/*   ('on-sight'), */
/*   ('ground up'), */
/*   ('redpoint'), */
/*   ('repeat'), */
/*   ('dogged'), */
/*   ('did not finish'); */

/* INSERT INTO users (name, email) */
/* VALUES */
/*   ('Gerben', 'hello@gerritneven.nl'), */
/*   ('Simon', 'hi@simon.co'), */
/*   ('Tom', 'tom@climbing.com'), */
/*   ('Doug', 'doug@lass.com'); */

/* INSERT INTO routes (name, grade_id, type_id) */
/* VALUES */
/*   ('Goose Creature', ( SELECT id FROM grades WHERE name='E3'), (SELECT id FROM route_types WHERE name='Trad')), */
/*   ('Seamstress', ( SELECT id FROM grades WHERE name='VS'), (SELECT id FROM route_types WHERE name='Trad')), */
/*   ('Seams the Same', ( SELECT id FROM grades WHERE name='E1'), (SELECT id FROM route_types WHERE name='Trad')), */
/*   ('Inkerman Groove', ( SELECT id FROM grades WHERE name='VS'), (SELECT id FROM route_types WHERE name='Trad')), */
/*   ('The Spider', ( SELECT id FROM grades WHERE name='E1'), (SELECT id FROM route_types WHERE name='Trad')), */
/*   ('Hydraulic Arete', ( SELECT id FROM grades WHERE name='HVS'), (SELECT id FROM route_types WHERE name='Trad')), */
/*   ('Suspension Flake', ( SELECT id FROM grades WHERE name='VS'), (SELECT id FROM route_types WHERE name='Trad')), */
/*   ('Immaculate Slab', ( SELECT id FROM grades WHERE name='HVS'), (SELECT id FROM route_types WHERE name='Trad')), */
/*   ('Albion', ( SELECT id FROM grades WHERE name='VS'), (SELECT id FROM route_types WHERE name='Trad')), */
/*   ('The Devil''s slide', ( SELECT id FROM grades WHERE name='HS'), (SELECT id FROM route_types WHERE name='Trad')), */
/*   ('Diamond Solitaire', ( SELECT id FROM grades WHERE name='VS'), (SELECT id FROM route_types WHERE name='Trad')); */

/* INSERT INTO entries (climber, date, style, route) */
/* VALUES */
/*   ((SELECT id FROM users WHERE name='Gerben'), '2017-06-30', (SELECT id FROM ascent_styles WHERE name='on-sight'), (SELECT id FROM routes WHERE name='Diamond Solitaire')), */
/*   ((SELECT id FROM users WHERE name='Gerben'), '2017-08-25', (SELECT id FROM ascent_styles WHERE name='on-sight'), (SELECT id FROM routes WHERE name='The Devil''s slide')), */
/*   ((SELECT id FROM users WHERE name='Gerben'), '2017-08-25', (SELECT id FROM ascent_styles WHERE name='on-sight'), (SELECT id FROM routes WHERE name='Albion')), */
/*   ((SELECT id FROM users WHERE name='Gerben'), '2017-08-26', (SELECT id FROM ascent_styles WHERE name='on-sight'), (SELECT id FROM routes WHERE name='Immaculate Slab')), */
/*   ((SELECT id FROM users WHERE name='Gerben'), '2017-09-02', (SELECT id FROM ascent_styles WHERE name='on-sight'), (SELECT id FROM routes WHERE name='Suspension Flake')); */

INSERT INTO entry_partners (entry, partner)
VALUES
  ('2640824a-86dd-4659-9a39-0dedf6dd3803', 332631401218998273),
  ('30751163-5882-4507-83fa-2d539604561f', 332631401218932737),
  ('aacc0ae8-453a-4e97-87e8-120fc6309b84', 332631401218932737),
  ('28b37280-d96e-4a96-adad-9f1eb02a42a9', 332631401218932737),
  ('0a9c18c1-ca4f-4c31-ac8f-5d4f79dc4789', 332631401218932737);
