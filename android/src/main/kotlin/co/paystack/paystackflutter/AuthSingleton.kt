package co.paystack.paystackflutter

/**
 * Created by Trushar Mistry on 21/06/2024 at 06:00.
 */
class AuthSingleton private constructor() {
    var responseJson = "{\"status\":\"requery\",\"message\":\"Reaffirm Transaction Status on Server\"}"
    var url = ""

    companion object {
        val instance = AuthSingleton()
    }

}
