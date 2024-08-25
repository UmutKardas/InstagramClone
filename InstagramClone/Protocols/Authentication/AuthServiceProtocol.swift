//
//  AuthServiceProtocol.swift
//  InstagramClone
//
//  Created by Hüseyin Umut Kardaş on 25.08.2024.
//
import Foundation

protocol AuthServiceProtocol {
    func login(withEmail email: String, password: String) async throws
    func register(withEmail email: String, password: String) async throws
    func logout() throws
}
