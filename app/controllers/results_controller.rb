class ResultsController < ApplicationController
  before_action :set_result, only: [:show, :edit, :update, :destroy]

  # GET /results
  def index
    @results = Result.order(sort_column + ' ' + sort_direction)
    .includes(:measure, publication: [:plant])
    .references(:measure, publication: [:plant])
    if params[:query]
      q = params[:query].upcase
      @results = @results.where('
        upper(value) LIKE ?
        OR upper(measures.type) LIKE ?
        OR upper(measures.delta_notation) LIKE ?
        OR upper(unit) LIKE ?
        OR upper(year) LIKE ?
        OR upper(authors) LIKE ?
        OR upper(journal) LIKE ?
        OR upper(volume) LIKE ?
        OR upper(page) LIKE ?
        OR upper(remarks) LIKE ?',
        "%#{q}%","%#{q}%","%#{q}%", "%#{q}%","%#{q}%","%#{q}%","%#{q}%","%#{q}%","%#{q}%","%#{q}%"
      )
    end
    if params[:plant_id]
      @results = @results.where('plant_id = ?',params[:plant_id])
    end
    if params[:publication_id]
      @results = @results.where(publication_id: params[:publication_id])
    end
    respond_to do |format|
      # Base html query
      format.html{ @results = @results.page params[:page]}
      # CSV download
      format.csv{
        render_csv do |out|
          out << CSV.generate_line(["Measure", "Notation", "Publication", "Value", "Unit"])
          @results.find_each(batch_size: 500) do |item|
            out << CSV.generate_line([
              item.measure.type,
              item.measure.delta_notation,
              item.publication.display_name,
              item.value,
              item.unit
            ])
          end
        end
      }
    end
  end

  # GET /results/1
  def show
  end

  # GET /results/new
  def new
    @result = Result.new
  end

  # GET /results/1/edit
  def edit
  end

  # POST /results
  def create
    @result = Result.new(resource_params)

    if @result.save
      redirect_to @result, notice: 'Result was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /results/1
  def update
    if @result.update(resource_params)
      redirect_to @result, notice: 'Result was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /results/1
  def destroy
    @result.destroy
    redirect_to results_url, notice: 'Result was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Result.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def resource_params
      params.require(:result).permit(:value, :unit, :measure_id, :publication_id)
    end
end
