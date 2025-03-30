//
//  BookmarkScreenView.swift
//  JobSearchApp
//
//  Created by Way2 on 27/03/25.
//

import SwiftUI

struct BookmarkScreenView: View {
    @ObservedObject private var viewModel = BottomNavigationBarViewModel()
    @ObservedObject var hometabviewmodel = HomeTabViewModel()

    var body: some View {
        NavigationView {
            ScrollView { 
                LazyVStack {
                    ForEach(hometabviewmodel.jobs) { job in
                        ZStack {
                            NavigationLink(destination: SaveJobDetailPage(job: job)) {
                            }
                            .opacity(0.0)
                            JobRow(job: job)
                                .padding(.bottom, 8)
                                .background(Color.clear)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .background(Color(.systemGray6))
            .navigationTitle("Save Job")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Delete all") {
                        withAnimation {
                            viewModel.showBottomSheet = false
                        }
                    }
                    .font(.system(size: 12))
                    .foregroundColor(.orange)
                }
            }
        }
    }
}


struct JobRow: View {
    let job: Job

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(.white)
                .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 2) 

            VStack {
                HStack(alignment: .top) {
                    Image(job.companyImageName)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())

                    VStack(alignment: .leading) {
                        Text(job.userRole)
                            .font(.headline)

                        Text("\(job.companyName) - \(job.location)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }

                    Spacer()
                    Button(action: {
                        print("More options tapped")
                    }) {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.gray)
                    }
                }
                .padding(.horizontal)

                HStack {
                    ForEach(job.tags, id: \.self) { tag in
                        TagView(tag: tag)
                    }
                    Spacer()
                }
                .padding(.horizontal)

                HStack {
                    Text(job.timeAgo)
                        .font(.caption)
                        .foregroundColor(.gray)

                    Spacer()
                    Text(job.salary)
                        .font(.headline)
                        .fontWeight(.bold)
                }
                .padding(.horizontal)
              

            }
            .padding()
            
        }

    }
}


struct TagView: View {
    let tag: String

    var body: some View {
        Text(tag)
            .font(.system(size: 10))
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Color(.systemGray6))
            .foregroundColor(.gray)
            .clipShape(Capsule())
    }
}

#Preview {
    BookmarkScreenView()
}


struct DeleteAllView: View {
    @ObservedObject private var viewModel = BottomNavigationBarViewModel()

    var body: some View {
        ZStack {
            // Main Content
            VStack {
                Text("Main Content of Your App")
                    .font(.title)
                Button("Show Bottom Sheet") {
                    withAnimation {
                        viewModel.showBottomSheet = true
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            // Bottom Sheet
            GeometryReader { geometry in
                VStack {
                    // Bottom Sheet Content
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white) //Background Color of the bottomsheet
                        .shadow(radius: 5)
                        .overlay {
                            VStack {
                                Capsule()
                                    .fill(.gray.opacity(0.5))
                                    .frame(width: 40, height: 5)
                                    .padding(.top, 10)

                                Text("What would you like to add?")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .padding(.top)

                                Text("Would you like to post your tips and experiences or create a job?")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                Button(action: {
                                    // Handle login action
                                  
                                    print("Login tapped")
                                }) {
                                    Text("POST")
                                        .font(FontStyle.dmsansBold.font(baseSize: 14))
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color(red: 0.145, green: 0.145, blue: 0.345)) // Dark blue color
                                        .cornerRadius(10)
                                }
                                .padding(.top)
                                Button(action: {
                                  
                                    print("Login tapped")
                                }) {
                                    Text("MAKE A JOB")
                                        .font(FontStyle.dmsansBold.font(baseSize: 14))
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(AppColors.pastelLavender)
                                        .cornerRadius(10)
                                }
                                .padding(.top, 5)

                                Spacer()
                            }
                            .padding()

                        }
                        .transition(.move(edge: .bottom))
                        .edgesIgnoringSafeArea(.bottom)

                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .position(x: geometry.size.width / 2, y: geometry.size.height*1.125)
                .offset(y: viewModel.showBottomSheet ? 0 : geometry.size.height)
            }
            .ignoresSafeArea()
            .background(viewModel.showBottomSheet ? Color.black.opacity(0.6) : Color.clear)
            .animation(.easeInOut(duration: 0.7), value: viewModel.showBottomSheet)
            .onTapGesture {
                if viewModel.showBottomSheet {
                    withAnimation {
                        viewModel.showBottomSheet = false
                    }
                }
            }

        }
        .ignoresSafeArea()

    }
}

#Preview {
    DeleteAllView()
}
