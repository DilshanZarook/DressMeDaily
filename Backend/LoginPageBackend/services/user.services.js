const UserModel=require("../model/user.model")

class UserService{
    static async registerUser(username,email,password,name,gender,age){
        try {
            const createUser=new UserModel({username,email,password,name,gender,age});
            return await createUser.save();
        } catch (error) {
            throw error;
        }
    }
}

module.exports= UserService;