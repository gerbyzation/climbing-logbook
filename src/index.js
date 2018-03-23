const fs = require('fs');
const path = require('path');
const express = require('express');
const graphqlHTTP = require('express-graphql');
const { makeExecutableSchema } = require('graphql-tools');

const schemaFile = path.join(__dirname, 'schema.graphql');
const typeDefs = fs.readFileSync(schemaFile, 'utf-8');

const db = require('./db')

const resolvers = {
  Query: {
    User: async (_, { id, name }, ctx) => {
      const res = await ctx.db.query('SELECT * FROM users WHERE id=$1 OR name=$2;', [id, name]);
      return res.rows[0];
    },
    Route: async (_, { id, name }, ctx) => {
      const res = await ctx.db.query('SELECT * FROM routes WHERE id=$1 OR name=$2;', [id, name])
      return res.rows[0];
    },
    Routes: async (_, { ids, grade }, ctx) => {
      const res = await ctx.db.query(
        `SELECT routes.id, routes.name, routes.grade, routes.type
         FROM routes, grades
         WHERE routes.grade_id = grades.id AND
         (id = ANY($1::int[]) OR grades.name = $2;`, [ids, grade]);
      return res.rows[0];
    },
    Entry: async (_, { id }, ctx) => {
      const res = await ctx.db.query(`
        SELECT entries.id, entries.climber, entries.date, entries.style, entries.route
        FROM entries,
        WHERE entries.id = $1;
      `, [id]);
      return res.rows[0];
    },
    Entries: async (_, { climber_name, grade, route_name }, ctx) => {
      // How to write query for this? just one bigass SQL statement?
      const res = await ctx.db.query(`
        SELECT entries.id, users.name, entries.date, ascent_styles.name as style, entries.route, routes.name
        FROM entries, users, grades, routes, ascent_styles
        WHERE entries.climber = users.id AND routes.id = entries.route AND routes.grade_id = grades.id AND entries.style = ascent_styles.id
        AND (users.name = $1 OR grades.name = $2 OR routes.name = $3);
        `, [climber_name, grade, route_name]);
      return res.rows;
    }
  },
  User: {
    id: user => user.id,
    name: user => user.name,
  },
  Route: {
    id: route => route.id,
    name: route => route.name,
    grade: async (route, _, ctx) => {
      const res = await ctx.db.query('SELECT * FROM grades WHERE id=$1;', [route.grade_id])
      return res.rows[0];
    },
    type: async (route, _, ctx) => {
      const res = await ctx.db.query('SELECT * FROM route_types WHERE id=$1;', [route.type_id])
      return res.rows[0].name;
    },
    ascents: async (route, _, ctx) => {
      const res = await ctx.db.query('SELECT * FROM entries WHERE route=$1;', [route.id]);
      return res.rows;
    }
  },
  Grade: {
    id: grade => grade.id,
    name: grade => grade.name
  },
  Entry: {
    id: entry => entry.id,
    Climber: async (entry, _, ctx) => {
      // TODO: can we not just call User query as we're basically repeating the same?
      const res = await ctx.db.query('SELECT * FROM users WHERE id=$1;', [entry.climber])
      return res.rows[0];
    },
    date: entry => entry.date,
    style:  entry => entry.style,
    Route: async (entry, _, ctx) => {
      const res = await ctx.db.query("SELECT * FROM routes WHERE id=$1;", [entry.route])
      return res.rows[0];
    }
  }
};

const schema = makeExecutableSchema({ typeDefs, resolvers });

const app = express()

app.use('/graphql', graphqlHTTP({
  schema: schema,
  graphiql: true,
  context: { db: db },
}));

app.get('/', (req, res) => {
  res.send('hello world');
})

app.listen(5000, () => console.log('Server is listening on port 5000'))
