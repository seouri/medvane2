class Gene < ActiveRecord::Base
  has_many :published_genes
  has_many :articles, :through => :published_genes
  has_many :gene_stats
  has_many :author_genes
  has_many :author, :through => :author_genes
  has_many :journal_genes
  has_many :journal, :through => :journal_genes

  def self.search(query, options = {})
    options[:page]      ||= 1
    options[:per_page]  ||= 20
    paginate options
  end

  def to_s
    "#{symbol} (#{taxonomy})"
  end
end
