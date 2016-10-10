class InstrutoresController < ApplicationController
  before_action :set_instrutor, only: [:show, :edit, :update, :destroy]

  # GET /instrutores
  # GET /instrutores.json
  def index
    @instrutores = Instrutor.all
  end

  # GET /instrutores/1
  # GET /instrutores/1.json
  def show
  end

  # GET /instrutores/new
  def new
    @instrutor = Instrutor.new
  end

  # GET /instrutores/1/edit
  def edit
  end

  # POST /instrutores
  # POST /instrutores.json
  def create
    @instrutor = Instrutor.new(instrutor_params)

    respond_to do |format|
      if @instrutor.save
        format.html { redirect_to @instrutor, notice: 'Instrutor was successfully created.' }
        format.json { render :show, status: :created, location: @instrutor }
      else
        format.html { render :new }
        format.json { render json: @instrutor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instrutores/1
  # PATCH/PUT /instrutores/1.json
  def update
    respond_to do |format|
      if @instrutor.update(instrutor_params)
        format.html { redirect_to @instrutor, notice: 'Instrutor was successfully updated.' }
        format.json { render :show, status: :ok, location: @instrutor }
      else
        format.html { render :edit }
        format.json { render json: @instrutor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instrutores/1
  # DELETE /instrutores/1.json
  def destroy
    @instrutor.destroy
    respond_to do |format|
      format.html { redirect_to instrutores_url, notice: 'Instrutor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instrutor
      @instrutor = Instrutor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instrutor_params
      params.require(:instrutor).permit(:nome, :email, :profissao,
        aulas_attributes: [:id, :dinamica, :semana, :quantidade_semanas,
          :monday_start, :monday_end, :tuesday_start, :tuesday_end,
          :wednesday_start, :wednesday_end, :thursday_start, :thursday_end,
          :friday_start, :friday_end, :saturday_start, :saturday_end,
          :sunday_start, :sunday_end, :_destroy]
      )
    end
end
