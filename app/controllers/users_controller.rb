class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
    if Rails.env.development?
      @slider = @user.posts.order("RANDOM()").limit(5)
    else
      @slider = @user.posts.order("RAND()").limit(5)
    end
    @archives = Post.divide_monthly(@user)
    # 制覇数
    hokkaido = Post.where(user_id: @user, prefecure: 1).count
    if hokkaido > 0
      @hokkaido = 1
    else
      @hokkaido = 0
    end
    aomori = Post.where(user_id: @user, prefecure: 2).count
    if aomori > 0
      @aomori = 1
    else
      @aomori = 0
    end
    iwate = Post.where(user_id: @user, prefecure: 3).count
    if iwate > 0
      @iwate = 1
    else
      @iwate = 0
    end
    miyagi = Post.where(user_id: @user, prefecure: 4).count
    if miyagi > 0
      @miyagi = 1
    else
      @miyagi = 0
    end
    akita = Post.where(user_id: @user, prefecure: 5).count
    if akita > 0
      @akita = 1
    else
      @akita = 0
    end
    yamagata = Post.where(user_id: @user, prefecure: 6).count
    if yamagata > 0
      @yamagata = 1
    else
      @yamagata = 0
    end
    fukusima = Post.where(user_id: @user, prefecure: 7).count
    if fukusima > 0
      @fukusima = 1
    else
      @fukusima = 0
    end
    ibaraki = Post.where(user_id: @user, prefecure: 8).count
    if ibaraki > 0
      @ibaraki = 1
    else
      @ibaraki = 0
    end
    tochigi = Post.where(user_id: @user, prefecure: 9).count
    if tochigi > 0
      @tochigi = 1
    else
      @tochigi = 0
    end
    gunma = Post.where(user_id: @user, prefecure: 10).count
    if gunma > 0
      @gunma = 1
    else
      @gunma = 0
    end
    saitama = Post.where(user_id: @user, prefecure: 11).count
    if saitama > 0
      @saitama = 1
    else
      @saitama = 0
    end
    chiba = Post.where(user_id: @user, prefecure: 12).count
    if chiba > 0
      @chiba = 1
    else
      @chiba = 0
    end
    tokyou = Post.where(user_id: @user, prefecure: 13).count
    if tokyou > 0
      @tokyou = 1
    else
      @tokyou = 0
    end
    kanagawa = Post.where(user_id: @user, prefecure: 14).count
    if kanagawa > 0
      @kanagawa = 1
    else
      @kanagawa = 0
    end
    niigata = Post.where(user_id: @user, prefecure: 15).count
    if niigata > 0
      @niigata = 1
    else
      @niigata = 0
    end
    toyama = Post.where(user_id: @user, prefecure: 16).count
    if toyama > 0
      @toyama = 1
    else
      @toyama = 0
    end
    isikawa = Post.where(user_id: @user, prefecure: 17).count
    if isikawa > 0
      @isikawa = 1
    else
      @isikawa = 0
    end
    fukui = Post.where(user_id: @user, prefecure: 18).count
    if fukui > 0
      @fukui = 1
    else
      @fukui = 0
    end
    yamanasi = Post.where(user_id: @user, prefecure: 19).count
    if yamanasi > 0
      @yamanasi = 1
    else
      @yamanasi = 0
    end
    nagano = Post.where(user_id: @user, prefecure: 20).count
    if nagano > 0
      @nagano = 1
    else
      @nagano = 0
    end
    gifu = Post.where(user_id: @user, prefecure: 21).count
    if gifu > 0
      @gifu = 1
    else
      @gifu = 0
    end
    sizuoka = Post.where(user_id: @user, prefecure: 22).count
    if sizuoka > 0
      @sizuoka = 1
    else
      @sizuoka = 0
    end
    aichi = Post.where(user_id: @user, prefecure: 23).count
    if aichi > 0
      @aichi = 1
    else
      @aichi = 0
    end
    mie = Post.where(user_id: @user, prefecure: 24).count
    if mie > 0
      @mie = 1
    else
      @mie = 0
    end
    siga = Post.where(user_id: @user, prefecure: 25).count
    if siga > 0
      @siga = 1
    else
      @siga = 0
    end
    kyoto = Post.where(user_id: @user, prefecure: 26).count
    if kyoto > 0
      @kyoto = 1
    else
      @kyoto = 0
    end
    ousaka = Post.where(user_id: @user, prefecure: 27).count
    if ousaka > 0
      @ousaka = 1
    else
      @ousaka = 0
    end
    hyogo = Post.where(user_id: @user, prefecure: 28).count
    if hyogo > 0
      @hyogo = 1
    else
      @hyogo = 0
    end
    nara = Post.where(user_id: @user, prefecure: 29).count
    if nara > 0
      @nara = 1
    else
      @nara = 0
    end
    wakayama = Post.where(user_id: @user, prefecure: 30).count
    if wakayama > 0
      @wakayama = 1
    else
      @wakayama = 0
    end
    tottori = Post.where(user_id: @user, prefecure: 31).count
    if tottori > 0
      @tottori = 1
    else
      @tottori = 0
    end
    simane = Post.where(user_id: @user, prefecure: 32).count
    if simane > 0
      @simane = 1
    else
      @simane = 0
    end
    okayama = Post.where(user_id: @user, prefecure: 33).count
    if okayama > 0
      @okayama = 1
    else
      @okayama = 0
    end
    hirosima = Post.where(user_id: @user, prefecure: 34).count
    if hirosima > 0
      @hirosima = 1
    else
      @hirosima = 0
    end
    yamaguchi = Post.where(user_id: @user, prefecure: 35).count
    if yamaguchi > 0
      @yamaguchi = 1
    else
      @yamaguchi = 0
    end
    tokusima = Post.where(user_id: @user, prefecure: 36).count
    if tokusima > 0
      @tokusima = 1
    else
      @tokusima = 0
    end
    kagawa = Post.where(user_id: @user, prefecure: 37).count
    if kagawa > 0
      @kagawa = 1
    else
      @kagawa = 0
    end
    ehime = Post.where(user_id: @user, prefecure: 38).count
    if ehime > 0
      @ehime = 1
    else
      @ehime = 0
    end
    kochi = Post.where(user_id: @user, prefecure: 39).count
    if kochi > 0
      @kochi = 1
    else
      @kochi = 0
    end
    fukuoka = Post.where(user_id: @user, prefecure: 40).count
    if fukuoka > 0
      @fukuoka = 1
    else
      @fukuoka = 0
    end
    saga = Post.where(user_id: @user, prefecure: 41).count
    if saga > 0
      @saga = 1
    else
      @saga = 0
    end
    nagasaki = Post.where(user_id: @user, prefecure: 42).count
    if nagasaki > 0
      @nagasaki = 1
    else
      @nagasaki = 0
    end
    kumamoto = Post.where(user_id: @user, prefecure: 43).count
    if kumamoto > 0
      @kumamoto = 1
    else
      @kumamoto = 0
    end
    ooita = Post.where(user_id: @user, prefecure: 44).count
    if ooita > 0
      @ooita = 1
    else
      @ooita = 0
    end
    miyazaki = Post.where(user_id: @user, prefecure: 45).count
    if miyazaki > 0
      @miyazaki = 1
    else
      @miyazaki = 0
    end
    kagosima = Post.where(user_id: @user, prefecure: 46).count
    if kagosima > 0
      @kagosima = 1
    else
      @kagosima = 0
    end
    okinawa = Post.where(user_id: @user, prefecure: 47).count
    if okinawa > 0
      @okinawa = 1
    else
      @okinawa = 0
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "プロフィールを更新"
    else
      render 'users/edit'
    end
  end

  def archives
    @user = User.find(params[:id])
    @archives = Post.divide_monthly(@user)
    @posts = @archives[params[:yyyymm]]
  end

  def favorites
    @user = User.find_by(id: params[:id])
    @favorites = Favorite.where(user_id: @user.id).order(created_at: :desc)
    @archives = Post.divide_monthly(@user)
  end

  def conquer
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :user_image)
  end
end
