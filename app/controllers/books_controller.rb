class BooksController < ApplicationController
  def top
  end

  def about
  end

  def ensure_correct_user
    @post = Post.find_by(id:params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/books/index")
    end
  end


  def index
  	# 空のモデルをビューへ渡す
    @book = Book.new
    @User = User.new
    # booksテーブルから全てのデータを取得し、変数@booksに代入しています
    @books = Book.all
    # binding.pry
    # ↓これだと、削除した本のidでユーザーを探そうとしてしまう。
    # @user = User.find(params[:id])
    @user = User.find(current_user.id)
  end

  def create
    # ストロングパラメーターを使用
    # @book = Book.new(content: params[:content], user_id: @current_user.id)
    book = Book.new(book_params)
    book.user_id = current_user.id
    # DBへ保存する
    book.save
    # マイページへリダイレクトただ、これだけじゃIDを取得できないのでerrorになる。そこで上に書いたように親であるbookからカラムに持っているuser_idを持ってきて、さらにログイン中のなのでcurrent_user.idとなる。『book.user_id = current_user.id』
    redirect_to user_path(book.user_id)
  end

  def show
  	@book = Book.find(params[:id])
    @user = User.find(current_user.id)
    @books = Book.all
    @bookf = Book.new

  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end

  def destroy
    @book = Book.find(params[:id])
    # メソッドなので、destroyではなくdelite
    @book.delete
    redirect_to books_path
  end

  private
      def book_params
        params.require(:book).permit(:title, :body, :user_id)
      end
end
