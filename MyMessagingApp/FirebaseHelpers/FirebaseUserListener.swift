//
//  FirebaseUserListener.swift
//  MyMessagingApp
//
//  Created by SAHIL AMRUT AGASHE on 27/11/23.
//

import Foundation
import Firebase

class FirebaseUserListener {
    static let shared = FirebaseUserListener()
    
    private init() {}
    
    // MARK: - Login
    
    // MARK: - Register
    func registerUserWith(email: String, password: String, completion: @escaping (_ error: Error?) -> Void) {
        
        Auth.auth().createUser(withEmail: email, password: password) { (authDataResult: AuthDataResult?, error: Error?) in
            completion(error)
            
            if error == nil {
                
                // send verification email
                authDataResult!.user.sendEmailVerification(completion: { error in
                    print("DEBUG: error in sendEmailVerification is \(error?.localizedDescription ?? "localizedDescription")")
                })
                
                // create user and save it
                if authDataResult?.user != nil {
                    let user = User(id: authDataResult!.user.uid, username: email, email: email, pushId: "", avatarLink: "", status: "Hey there I'm using messenger")
                    saveUserLocally(user)
                    self.saveUserToFireStore(user)
                }
            }
        }
    }
    
    // MARK: - Save Users
    func saveUserToFireStore(_ user: User) {
        do {
            try FirebaseReference(.User).document(user.id).setData(from: user)
        } catch {
            print("DEBUG: Error while saving user to firestore is \(error.localizedDescription)")
        }
    }
    
}
