const mongoose=require("mongoose");
const dB=require("../config/db");
const bcrypt=require("bcrypt");


const {Schema}=mongoose;

const userSchema=new Schema({
    username:{
        type: String,
        required: true,
        unique: true,
        match: /^[a-zA-Z0-9]+$/
    },
    email:{
        type: String,
        lowercase: true,
        required: true,
        unique: true
    },
    password:{
        type: String,
        required: true
    },
    name:{
        type:String,
        required: true
    },
    gender:{
        type:String,
        required: true
    },
    age:{
        type: Number, // Assuming age is a number, you can adjust the type accordingly
        min: 18, // Optional: You can set minimum and maximum values for age
        max: 100
    }
});

userSchema.pre("save",async function(){
    try {
        var user=this;
        const salt= await(bcrypt.genSalt(10));
        const hashpass=await bcrypt.hash(user.password,salt);

        user.password=hashpass;

    } catch (error) {
        throw error;
    }
});

const UserModel =dB.model("user",userSchema);

module.exports=UserModel;