module Formulan
  class FormsController < ApplicationController
    # GET /formulan/:identifier
    def new
      @form = Formulan.fetch(params[:identifier])
    end

    # POST /formulan/:identifier
    def create
      @form = Formulan.fetch(params[:identifier])
      redirect_to formulan_thanks_path(identifier: params[:identifier])
    end

    # GET /formulan/:identifier/thanks
    def thanks
    end
  end
end
