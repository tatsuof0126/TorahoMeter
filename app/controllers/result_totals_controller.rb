class ResultTotalsController < ApplicationController
  before_action :set_result_total, only: [:show, :edit, :update, :destroy]

  # GET /result_totals
  # GET /result_totals.json
  def index
    @result_totals = ResultTotal.all
  end

  # GET /result_totals/1
  # GET /result_totals/1.json
  def show
  end

  # GET /result_totals/new
  def new
    @result_total = ResultTotal.new
  end

  # GET /result_totals/1/edit
  def edit
  end

  # POST /result_totals
  # POST /result_totals.json
  def create
    @result_total = ResultTotal.new(result_total_params)

    respond_to do |format|
      if @result_total.save
        format.html { redirect_to @result_total, notice: 'Result total was successfully created.' }
        format.json { render :show, status: :created, location: @result_total }
      else
        format.html { render :new }
        format.json { render json: @result_total.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /result_totals/1
  # PATCH/PUT /result_totals/1.json
  def update
    respond_to do |format|
      if @result_total.update(result_total_params)
        format.html { redirect_to @result_total, notice: 'Result total was successfully updated.' }
        format.json { render :show, status: :ok, location: @result_total }
      else
        format.html { render :edit }
        format.json { render json: @result_total.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /result_totals/1
  # DELETE /result_totals/1.json
  def destroy
    @result_total.destroy
    respond_to do |format|
      format.html { redirect_to result_totals_url, notice: 'Result total was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result_total
      @result_total = ResultTotal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def result_total_params
      params.require(:result_total).permit(:keyword_id, :last_searched_date, :max_tweet_id, :total_tweet_count)
    end
end
