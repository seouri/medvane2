class Gene < ActiveRecord::Base
  has_many :published_genes
  has_many :articles, :through => :published_genes, :include => :journal, :order => "published_genes.article_id"
  has_many :gene_stats, :order => "gene_stats.year"
  has_many :authors, :class_name => "AuthorGene", :include => :author
  has_many :author_gene_years
  has_many :journals, :class_name => "JournalGene", :include => :journal
  has_many :journal_gene_years
  has_many :subjects, :class_name => "SubjectGene", :include => [:subject => :subject_stats]
  has_many :subject_gene_years

  def self.search(query, options = {})
    options[:conditions] = ["#{options[:conditions]} AND #{Gene.table_name}.symbol LIKE ?", "#{query}%"] unless query.blank?
    options[:page]      ||= 1
    options[:per_page]  ||= 30 
    paginate options
  end

  def to_s
    "#{symbol} (#{taxonomy})"
  end
end
