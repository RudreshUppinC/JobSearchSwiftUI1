//
//  ProfileViewModal.swift
//  JobSearchApp
//
//  Created by RudreshUppin on 19/05/25.
//

import Foundation
import SwiftUI
import Combine
import CoreData


class ProfileViewModal: ObservableObject {
    @Published var isAboutMeDetailView: Bool  = false
    @Published var isEditProfileDetailView: Bool  = false
    @Published var userProfile: UserProfile
    @Published var isWorkDetailView: Bool  = false
    @Published var isEducationDetailView: Bool  = false

    @Published var showSheet: Bool = false

    init(userProfile:UserProfile) {
        self.userProfile = userProfile
         
    }
       
    func showAboutMeDetailView() {
        isAboutMeDetailView = true
    }
    
    func addEducationTapped(){
        print(#function)
        
    }
    
    func editEducationTapped(){
        print(#function)
        
    }
    
    
    
    //AboutMe
        @Published var savedSuccessfully: Bool = false
        
        private var viewContext: NSManagedObjectContext {
            return CoreDataManager.shared.container.viewContext
        }
        
        // Fetches the existing "About Me" text from Core Data
        func fetchAboutMeText() -> String {
            let request = NSFetchRequest<ProfileEntity>(entityName: "ProfileEntity")
            do {
                // We assume there is only one profile entry. Fetch the first one if it exists.
                let profile = try viewContext.fetch(request).first
                return  profile?.aboutMe ?? ""

            } catch {
                print("Error fetching profile: \(error)")
                return ""
            }
        }
        
        // Saves or updates the "About Me" text
        func saveAboutMe(text: String) {
            let request = NSFetchRequest<ProfileEntity>(entityName: "ProfileEntity")
            
            do {
                let profile = try viewContext.fetch(request).first
                
                if let existingProfile = profile {
                    // If a profile exists, UPDATE it
                    existingProfile.aboutMe = text
                    print("Updating existing profile about me text.")
                } else {
                    // If no profile exists, CREATE a new one
                    let newProfile = ProfileEntity(context: viewContext)
                    newProfile.aboutMe = text
                    self.userProfile.aboutMe = text

                    print("Creating new profile and saving about me text.")
                }
                
                // Save the changes to Core Data
                CoreDataManager.shared.saveContext()
                
                // Give feedback to the UI
                savedSuccessfully = true
                
            } catch {
                print("Error saving or updating profile: \(error)")
            }
        }
      
    func deleteAboutMe() {
           let request = NSFetchRequest<ProfileEntity>(entityName: "ProfileEntity")
           do {
               if let profileToDelete = try viewContext.fetch(request).first {
                   
                   viewContext.delete(profileToDelete)
                   CoreDataManager.shared.saveContext()
                   userProfile.aboutMe = ""
                   print("Successfully deleted profile data.")
                   
               } else {
                   print("No profile data found to delete.")
               }
               
           } catch {
               print("Error finding or deleting profile: \(error)")
           }
       }
}
