
import { timeStamp } from "console";
import express from "express";

const app = express();
app.use(express.json());

app.get("/", (req, res) => {
    res.send("Backend rodando na EC2 local");
});

app.get("/helth", (req, res) => {
    res.json({status: "ok", timeStamp: new Date()});
});


app.listen(3000, () => {
    console.log("Servidor Node rodando na porta 3000")
})