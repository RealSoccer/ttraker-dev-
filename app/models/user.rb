class User < ActiveRecord::Base
  validate :check_user_limit, :on => :create
  validates_presence_of :email
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :firstname, :lastname, :owns_company, :company, :company_admin, :current_password
  belongs_to :company
  has_many :project_users, :dependent => :destroy
  has_many :projects, :through => :project_users
  has_many :timeslips
  has_many :developer_applications
  has_one  :subscription
  has_one  :token

  def to_s
    "#{firstname} #{lastname}"
  end

  private

  def check_user_limit
    if company && company.plan.user_count <= company.users.count
      self.errors[:base] << "You have reached your user limit. If you wish to add more users, please upgrade your account."
      return false
    end
  end

end
