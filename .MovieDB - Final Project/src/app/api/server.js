
const cors = require('cors');

const express = require('express');
const droptables = require('./DropTables');
const createtables = require('./CreateTables');
const createviews = require('./CreateViews');
const dropviews = require('./DropViews');
const populatetables = require('./PopulateTables');

const app = express();
const port = 3001; //server port is different from frontend

app.use(cors());

app.get("/api", (req,res) =>
{
  res.send("Hello world!")

})

app.post('/api/CreateTables', async (req, res) => {
  try {
    await createtables();
    res.status(200).json({ success: true });
  } catch (err) {
    console.error(err);
    res.status(500).json({ success: false, error: err.message });
  }
});

app.post('/api/DropTables', async (req, res) => {
  try {
    await droptables();
    res.status(200).json({ success: true });
  } catch (err) {
    console.error(err);
    res.status(500).json({ success: false, error: err.message });
  }
});

app.post('/api/CreateViews', async (req, res) => {
  try {
    await createviews();
    res.status(200).json({ success: true });
  } catch (err) {
    console.error(err);
    res.status(500).json({ success: false, error: err.message });
  }
});

app.post('/api/DropViews', async (req, res) => {
  try {
    await dropviews();
    res.status(200).json({ success: true });
  } catch (err) {
    console.error(err);
    res.status(500).json({ success: false, error: err.message });
  }
});

app.post('/api/PopulateTables', async (req, res) => {
  try {
    await populatetables();
    res.status(200).json({ success: true });
  } catch (err) {
    console.error(err);
    res.status(500).json({ success: false, error: err.message });
  }
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
