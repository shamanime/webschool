# encoding: utf-8
class Coordenador
  include Mongoid::Document
  include Mongoid::Timestamps

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :trackable, :timeoutable

  ## Database authenticatable
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""

  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  # field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  ## Token authenticatable
  # field :authentication_token, :type => String
  field :nome, type: String
  field :ativo, type: Boolean, default: true

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :role_ids, :as => :admin
  attr_accessible :nome, :email, :password, :password_confirmation, :ativo

  validates :nome,
    :presence => true,
    :length => { :minimum => 4, :maximum => 60, :allow_blank => true }
  validates :email,
    :format => { :with => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i, :allow_blank => true },
    :uniqueness => { :case_sensitive => false },
    :presence => true
  validates_presence_of :password, :on => :create
  validates :password,
    :presence => true,
    :length => { :minimum => 6, :maximum => 40 },
    :confirmation => true,
    :allow_blank => true

  def active_for_authentication?
    # Comment out the below debug statement to view the properties of the returned self model values.
    # logger.debug self.to_yaml
    super && ativo?
  end
end
