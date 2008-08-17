class Author < ActiveRecord::Base
  has_many :authorships
  has_many :articles, :through => :authorships
  has_many :author_stats

  def self.search(query, options = {})
    options[:page]      ||= 1
    options[:per_page]  ||= 20
    paginate options
  end

  def to_s
    if collective_name.empty?
      "#{last_name}, #{fore_name}"
    else
      collective_name
    end
  end
end
