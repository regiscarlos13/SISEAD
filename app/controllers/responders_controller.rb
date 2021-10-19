class RespondersController < ApplicationController

  def create
    @forum = Forum.find(params[:forum_id])
    @responder = @forum.responders.create(comment_params)

    redirect_to forum_path(@forum)
  end

  def destroy
    @forum = Forum.find(params[:forum_id])
    
    @responder = @forum.responders.find(params[:id])

    @responder.destroy
    redirect_to forum_path(@forum)
  end


  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_disciplina
      @responder = Responder.find(params[:id])
    end

  def comment_params
    params.require(:responder).permit(:resposta)
  end



end