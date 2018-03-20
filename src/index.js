const fs = require('fs');
const path = require('path');
const express = require('express');
const graphqlHTTP = require('express-graphql');
const { makeExecutableSchema } = require('graphql-tools');

const schemaFile = path.join(__dirname, 'schema.graphql');
const typeDefs = fs.readFileSync(schemaFile, 'utf-8');

var db = require('./db')

const resolvers = {
  Query: {
    User: async (_, { id, name }) => {
      const res = await db.query('SELECT * FROM users WHERE id=$1 OR name=$2;', [id, name]);
      return res.rows[0];
    },
    Route: async (_, { id, name }) => {
      const res = await db.query('SELECT * FROM routes WHERE id=$1 OR name=$2;', [id, name])
      return res.rows[0];
    },
  },
  User: {
    id: user => user.id,
    name: user => user.name,
  },
  Route: {
    id: route => route.id,
    name: route => route.name,
    grade: async route => {
      const res = await db.query('SELECT * FROM grades WHERE id=$1;', [route.grade_id])
      return res.rows[0];
    },
    type: async route => {
      const res = await db.query('SELECT * FROM route_types WHERE id=$1;', [route.type_id])
      return res.rows[0].name;
    },
  },
  Grade: {
    id: grade => grade.id,
    name: grade => grade.name
  }
};
const schema = makeExecutableSchema({ typeDefs, resolvers });

const app = express()

app.use('/graphql', graphqlHTTP({
  schema: schema,
  graphiql: true,
}));

app.get('/', (req, res) => {
  res.send('hello world');
})

app.listen(5000, () => console.log('Server is listening on port 5000'))
