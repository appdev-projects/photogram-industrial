class Comment < ApplicationRecord
  belongs_to :author, clas_name: "User"
  belongs_to :photo
end
