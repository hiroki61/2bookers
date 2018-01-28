class BookImagesController < ApplicationController

	def new
		@book_image = BookImage.new
    end

    def create
	    @book_image = BookImage.new(book_image_params)
	    @book_image.user_id = current_user.id
	    @book_image.save
	    redirect_to book_images_path
    end
    def index
    end
    def show
    end
end

private
    def post_image_params
        params.require(:book_image).permit(:book_title, :image, :caption, :user_id)
    end

