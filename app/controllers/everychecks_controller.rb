class EverychecksController < ApplicationController
  before_action :set_everycheck, only: %i[ show edit update destroy ]

  def confirm
    #今回はユーザーid 1の人がログインしたと想定します。

    current_user = User.first
     #これが買い物かごページの確定ボタンが押された際くるパラメーターです杉浦さんの実装によってはかわるのであくまでサンプルです。　
    buy_cart_page_parameter_sample =[
      {
        foodname: "ビックマック",
        calorie: 200,
        eat_date: Date.today,
      },
      {
        foodname: "カツ丼",
        calorie: 600,
        eat_date: Date.today,
      }
     ]
     #ログインユーザーの食べたものインスタンスリストを作成メソッドはuserモデル参照
     @eattings = current_user.user_eattings(buy_cart_page_parameter_sample)  #=>ここに買い物かごから来たパラメーターを格納してインスタンス作成

     #トータルのカロリーを計算したものです作成メソッドはeverychecksモデル参照
     @totalCal = Everycheck.total_cal(@eattings)     #=>上の作成インスタンスリストを代入します。
  end
  





  # GET /everychecks or /everychecks.json
  def index
    @everychecks = Everycheck.all
  end

  # GET /everychecks/1 or /everychecks/1.json
  def show
  end

  # GET /everychecks/new
  def new
    @everycheck = Everycheck.new
  end

  # GET /everychecks/1/edit
  def edit
  end
#
  # POST /everychecks or /everychecks.json
  def create
    User.create(name: 'poco')
    user = User.first
    params[:everychecks].each do |param|
       user.everychecks.create(
         foodname: param[:foodname],
         calorie: params[:calorie],
         eat_date: params[:eat_date]
       )
    end
    redirect_to everychecks_url,notice: '登録完了'
  end

  # PATCH/PUT /everychecks/1 or /everychecks/1.json
  def update
    respond_to do |format|
      if @everycheck.update(everycheck_params)
        format.html { redirect_to @everycheck, notice: "Everycheck was successfully updated." }
        format.json { render :show, status: :ok, location: @everycheck }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @everycheck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /everychecks/1 or /everychecks/1.json
  def destroy
    @everycheck.destroy
    respond_to do |format|
      format.html { redirect_to everychecks_url, notice: "Everycheck was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_everycheck
      @everycheck = Everycheck.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def everycheck_params
      params.require(:everycheck).permit(:foodname, :calorie, :eat_date, :eat_time)
    end
end
