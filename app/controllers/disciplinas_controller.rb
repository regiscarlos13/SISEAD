class DisciplinasController < ApplicationController

  layout 'blank'
  http_basic_authenticate_with name: "admin", password: "root", except: [:planejamento, :show]
  
  before_action :set_disciplina, only: [:show, :edit, :update, :destroy]
  # GET /disciplinas
  # GET /disciplinas.json


  def planejamento
    
    if cookies.encrypted[:selected_professor].blank?
      redirect_to root_path
    end

    @disciplinas = Disciplina.where(professor: cookies.encrypted[:selected_professor])
  end


  def index
    @disciplinas = Disciplina.all
  end

  # GET /disciplinas/1
  # GET /disciplinas/1.json
  def show
  end


  # GET /disciplinas/new
  def new
    @disciplina = Disciplina.new
  end

  # GET /disciplinas/1/edit
  def edit
  end

  # POST /disciplinas
  # POST /disciplinas.json
  def create
    @disciplina = Disciplina.new(disciplina_params)

    respond_to do |format|
      if @disciplina.save
        format.html { redirect_to @disciplina, notice: @created }
        format.json { render :show, status: :created, location: @disciplina }
      else
        format.html { render :new }
        format.json { render json: @disciplina.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /disciplinas/1
  # PATCH/PUT /disciplinas/1.json
  def update
    respond_to do |format|
      if @disciplina.update(disciplina_params)
        format.html { redirect_to @disciplina, notice: @update }
        format.json { render :show, status: :ok, location: @disciplina }
      else
        format.html { render :edit }
        format.json { render json: @disciplina.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disciplinas/1
  # DELETE /disciplinas/1.json
  def destroy
    @disciplina.destroy
    respond_to do |format|
      format.html { redirect_to disciplinas_url, notice: @destroy }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_disciplina
      @disciplina = Disciplina.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def disciplina_params
      params.require(:disciplina).permit(:name, :professor, :serie, :turma)
    end
  end
