import Foundation
struct BookDetailList: Codable, Hashable {
  let status: Int
  let success: Bool
  let message: String
  let data: BookDetailData
}
struct BookDetailData: Codable,Hashable {
  let userId: Int
  let book: UserLendingInfo
}
struct UserLendingInfo: Codable ,Hashable{
  let id: Int
  let image, name, author, publisher, description: String
  let pubDate, returnDate: String
}
