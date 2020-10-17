class PrefecuresController < ApplicationController
  def prefecure
  end

  private

  def prefecure_params
    params.require(:prefecure).permit(:prefecure)
  end
end
