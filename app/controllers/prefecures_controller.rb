class PrefecuresController < ApplicationController
  before_action :authenticate_user!
  def prefecure
  end

  private

  def prefecure_params
    params.require(:prefecure).permit(:prefecure)
  end
end
