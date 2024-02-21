const UserService=require("../services/user.services");

exports.register=async(req,res,next)=>{
    try {
        const{username,email,password,name,gender,age}=req.body;

        const successsRes=await UserService.registerUser(username,email,password,name,gender,age);

        res.json({status:true,success:"User Registered Successfully"});
    } catch (error) {
        throw error;
    }
}