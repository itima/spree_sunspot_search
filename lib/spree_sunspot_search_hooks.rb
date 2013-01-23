class SpreeSolrSearchHooks < Spree::ThemeSupport::HookListener
  insert_before :search_results, 'products/facets'
  insert_before :search_results, 'products/sort_bar'
  insert_after :inside_head do
    "<%= javascript_include_tag 'solr_sort_by' %>"
  end
end
