class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :login
  has_many :trips, dependent: :destroy
  has_many :participations, dependent: :destroy
  has_many :reviews
  has_one :profile

  has_many :confirmed_participations, -> {is_confirmed}, :class_name => 'Participation'
  has_many :confirmed_trips, through: :confirmed_participations, source: :trip

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,  :authentication_keys => [:login]

  validates :username,  :uniqueness => {
    :case_sensitive => false }, presence: true, length: {maximum: 20}, format: {with: /\A[a-zA-Z0-9]+\z/}
  validates :encrypted_password, presence: true
  validates :email, presence: true, format: {with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/}, uniqueness: true

  after_create :create_profile

  def self.find_for_database_authentication(conditions={})
    self.where("username = ?", conditions[:login]).limit(1).first ||
    self.where("email = ?", conditions[:login]).limit(1).first
  end

  private

  def create_profile
    self.profile = Profile.create
  end

end
