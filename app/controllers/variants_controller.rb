class VariantsController  < ShopifyApp::AuthenticatedController
  before_action :set_variant, only: [:show, :edit, :update, :destroy]

  # GET /variants
  # GET /variants.json
  def index
    @variants = Variant.all
  end

  # GET /variants/1
  # GET /variants/1.json
  def show
  end

  # GET /variants/new
  def new
    @variant = Variant.new
  end

  # GET /variants/1/edit
  def edit
  end

  # POST /variants
  # POST /variants.json
  def create
    @variant = Variant.new(variant_params)

    respond_to do |format|
      if @variant.save
        format.html { redirect_to products_path, notice: 'variant was successfully created.' }
        format.json { render :show, status: :created, location: @variant }
      else
        format.html { render :new }
        format.json { render json: @variant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /variants/1
  # PATCH/PUT /variants/1.json
  def update
    respond_to do |format|
      if @variant.update(variant_params)
        # update variant in shopify DB using shopify API
        # find the inventory_item_id
        item = ShopifyAPI::InventoryLevel.find(:all, params: {:inventory_item_ids => @variant.inventory_item_id}).first
        item.set(@variant.quantity)

        format.html { redirect_to products_path, notice: 'variant was successfully updated.' }
        format.json { render :show, status: :ok, location: @variant }
      else
        format.html { render :edit }
        format.json { render json: @variant.errors, status: :unprocessable_entity }
      end
    end
  end

  def bulk_update
    # why doesn't this work? -> products_helper.rb VVV VVV VVV
    # bulk_update_quantities(params[:variants][:ids], params[:variants][:quantities])
    ids = params[:variants][:ids]
    quantities = params[:variants][:quantities]

    ids.each_with_index do |var_id, index|
      begin
        variant = Variant.find_by(variant_id: var_id)
        variant.update!(quantity: quantities[index])

        item =ShopifyAPI::InventoryLevel.find(:all, params: {:inventory_item_ids => variant.inventory_item_id}).first
        item.set(variant.quantity)
      rescue Exception => e
        puts "e: #{e.inspect}"
        next
      end
    end

    render json: { success: true }

  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_variant
    @variant = Variant.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def variant_params
    params.require(:variant).permit(:title, :quantity)
  end

end
