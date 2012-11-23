module SourcesHelper
  def setup_source source
    source.authors.build if source.authors.empty?
    source
  end
end
