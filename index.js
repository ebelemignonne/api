const express = require('express');
const app = express();
var mysql = require('mysql');


app.use(express.json());

const connecte = mysql.createConnection({
    host: "localhost",
    user: "root",
    password:"",
    database: "city_sport"
});

connecte.connect((err) => {
    if (err) {console.log("pas de connection" + err);} else {console.log("bien connecté!");}
});

app.get("/", (req, res) => {
  res.send("Hello world");
}); 

//Selectionne toutes les information de la table chaussure
app.get('/api/chaussure', (req, res) => {
  connecte.query("SELECT * FROM chaussure", (err, result) => {
    if (err) res.status(500).send("probleme" + err);

    res.status(200).json(result);
  });
});


//Selection une chaussure de la table chaussure

app.get("/api/get/:id", (req, res) => {
  connecte.query(
    "SELECT * FROM chaussure WHERE id_chaussure=?",
    [req.params.id_chaussure],
    (err, result) => {
      if (err) res.status(500).send("probleme" + err);

      res.status(200).json(result);
    }
  );
});

app.post("/api/post", (req, res) => {
  const id_chaussure = req.body.id_chaussure;
  const couleure = req.body.couleure;
  const marque = req.body.marque;
  const taille = req.body.taille;
  const prix = req.body.prix;
  const nom_chaussure = req.body.nom_chaussure;

  connecte.query(
    "INSERT INTO chaussure VALUES(NULL,?,?,?,?,?,?)",
    [id_chaussure, couleure, marque, taille, prix, nom_chaussure],
    (err, result) => {
      if (err) {
        console.log("probleme" + err);
      } else {
        res.send("POSTED");
      }
    }
  );
});

app.listen(3010, (err) => {
  if (err) {
    console.log("probleme" + err);
  } else {
    console.log("activé au port 3010");
  }
});

