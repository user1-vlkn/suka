import { Pool } from "../../Pool";
export class MerchantController {
    static async getAllMerchants(){
        return 'all merchants';
    }
    static async getMerchantByUID(data: any){
        try {
            const merchant = await Pool.X.merchant.findUnique({
                where: {uid: data.merchant_uid}
            }) 
            if (merchant){
                const session = await Pool.X.session.findUnique({
                    where: {uid: data.session_uid}
                })  
                if (session) {
                    return session
                } else return {"message": "session is not found"}
                
            }

            else {
                return {"message": "merchant is not found"}
            }
        } catch (e){
            console.log(e)
        }
    }
}

// create ???
// отменить оплату
