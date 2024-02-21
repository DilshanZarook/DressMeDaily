const mongoose=require("mongoose");

const connection=mongoose.createConnection("mongodb+srv://ivantha20211348:r2TbPtLmR7V4BvRn@userdetailsdb.iqgwvxo.mongodb.net/?retryWrites=true&w=majority").on("open",()=>{
    console.log("MongodB connected");
}).on("error",()=>{
    console.log("MongodB connection error");
});


module.exports=connection;