class AuthorGeneYear < ActiveRecord::Base
  belongs_to :author
  belongs_to :gene
end
