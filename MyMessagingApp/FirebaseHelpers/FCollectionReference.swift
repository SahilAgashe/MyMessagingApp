//
//  FCollectionReference.swift
//  MyMessagingApp
//
//  Created by SAHIL AMRUT AGASHE on 27/11/23.
//

import Foundation
import FirebaseFirestore

enum FCollectionReference: String {
    case User
    case Recent
}

func FirebaseReference(_ collectionReference: FCollectionReference) -> CollectionReference {
    return Firestore.firestore().collection(collectionReference.rawValue)
}
