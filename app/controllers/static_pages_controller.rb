class StaticPagesController < ApplicationController
  def home
  end

  def help
  end
  
  def contact
  end

  def error_404
  end

  def sign_in
  end

  # GET /ncbi_taxon_id2full_taxon_hierarchy
  def ncbi_taxon_id2full_taxon_hierarchy
    @taxon = TaxonWithName.find_by_ncbi_taxon_id(params[:ncbi_taxon_id])
    @hierarchy = @taxon.all_up_to_root
    respond_to do |format|
      format.json {render json: @hierarchy }
    end      
  end
end
