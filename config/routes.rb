SllBiosql::Application.routes.draw do
  resources :functions
  get "functional_hierarchy" => "functions#functional_hierarchy"

  resources :organism_group_rows

  resources :organism_groups
  get "organism_group_by_name/:name" => "organism_groups#show_by_name"

  resources :taxon_attributes

  resources :protein_gi_taxons
  resources :fetch_gis
  
  resources :sequenced_genomes
  get "wgs_ncbi_taxon_ids" => "sequenced_genomes#all_ncbi_taxon_ids"
  get "gi2ncbi_taxon_id" => "protein_gi_taxons#gi2ncbi_taxon_id"
  get "gis2ncbi_taxon_ids" => "protein_gi_taxons#gis2ncbi_taxon_ids"
  resources :taxon_with_names

  root to: "static_pages#home"
  
  get "ncbi_taxon_id2full_taxon_hierarchy" => "taxon_with_names#ncbi_taxon_id2full_taxon_hierarchy"
  get "ncbi_taxon_ids2full_taxon_hierarchies" => "taxon_with_names#ncbi_taxon_ids2full_taxon_hierarchies"
  get "organism_group_name2full_taxon_hierarchies/:name" => "taxon_with_names#organism_group_name2full_taxon_hierarchies"

  # Returns a list of unique taxa in full hierarchy format, given a list of gis
  get "gis2taxa" => "taxon_with_names#gis2taxa"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
